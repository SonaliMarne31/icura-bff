const { Pool } = require("pg");
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
require('dotenv').config();

const pool = new Pool({
  host: process.env.DB_HOST || "localhost",
  port: parseInt(process.env.DB_PORT || "5432"),
  database: process.env.DB_NAME || "medportal",
  user: process.env.DB_USER || "postgres",
  password: process.env.DB_PASSWORD || "password",
  max: 10,               // max connections in pool
  idleTimeoutMillis: 30000,  // close idle connections after 30s
  connectionTimeoutMillis: 2000,
});


const JWT_SECRET = process.env.JWT_SECRET;     // min 32 chars, never commit
const JWT_EXPIRES = process.env.JWT_EXPIRES || '1h';

async function getPendingTasks(doctorId, clinicId) {
  const tasks = await pool.query(`
    SELECT id, title, description, status, due_date
    FROM tasks
    WHERE doctor_id = $1  
      AND clinic_id = $2  
    ORDER BY due_date ASC
  `, [doctorId, clinicId]);

  return tasks.rows;
}

async function getAppointments(doctorId, clinicId) {
  const appts = await pool.query(`
    SELECT
        a.id,
        a.status,
        a.reason,
        a.notes,
        a.start_time,
        a.end_time,
        a.timezone,
        a.appointment_type,
        a.doctor_id,
        a.clinic_id,
        p.id          AS patient_id,
        p.first_name,           -- ✅ no alias needed
        p.last_name,            -- ✅ no alias needed
        p.dob,
        p.phone,
        p.email
    FROM appointments a
    JOIN patients p ON a.patient_id = p.id
    WHERE a.doctor_id = $1
      AND a.clinic_id = $2
    ORDER BY a.start_time ASC
`, [doctorId, clinicId]);


  return appts.rows;

}


async function registerClaims(email, password, clinicCode) {

  // 1. Look up clinic by code
  const clinicResult = await pool.query(
    `SELECT id, name, timezone FROM clinics WHERE id = $1`,
    [clinicCode]
  );
  if (clinicResult.rows.length === 0) {
    throw new Error('Invalid credentials');      // don't reveal what was wrong
  }
  const clinic = clinicResult.rows[0];

  // 2. Look up doctor by email AND clinic  (multi-tenant: same email can exist in multiple clinics)
  const doctorResult = await pool.query(
    `SELECT id, first_name, last_name, status, password_hash
     FROM   doctors
     WHERE  email    = $1
       AND  clinic_id = $2`,
    [email, clinic.id]
  );
  if (doctorResult.rows.length === 0) {
    throw new Error('Invalid credentials');
  }
  const doctor = doctorResult.rows[0];

  // 3. Check account is active
  if (doctor.status !== 'active') {
    throw new Error('Account is inactive');
  }

  // 4. Verify password
  console.log('doctor.password_hash', doctor.password_hash, ' password ', password);
  const valid = await bcrypt.compare(password, doctor.password_hash);

  if (!valid) {
    throw new Error('Invalid credentials');
  }

  // 5. Issue JWT — clinicId and doctorId come from DB, never from user input
  const payload = {
    sub: doctor.id,           // standard JWT subject
    doctorId: doctor.id,           // explicit claim — used by BFF and backend
    clinicId: clinic.id,           // explicit claim — used for multi-tenancy
    clinicName: clinic.name,
    name: `${doctor.first_name} ${doctor.last_name}`,
    role: 'doctor',
  };

  const token = jwt.sign(payload, JWT_SECRET, {
    expiresIn: JWT_EXPIRES,
    issuer: 'medportal-bff',
    audience: 'medportal-api',
  });

  return token;
}

function verifyToken(req, res, next) {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader?.startsWith('Bearer ')) {
      return res.status(401).json({ error: 'No token provided' });
    }

    // ✅ extract token from "Bearer <token>"
    const token = authHeader.split(' ')[1];

    // ✅ verify signature, expiry, issuer, audience
    const decoded = jwt.verify(token, JWT_SECRET, {
      issuer: 'medportal-bff',
      audience: 'medportal-api',
    });

    console.log('decoded claims:', decoded);

    // ✅ attach to req.user — available in every route handler below
    req.user = {
      doctorId: decoded.doctorId,
      clinicId: decoded.clinicId,
      clinicName: decoded.clinicName,
      name: decoded.name,
      role: decoded.role,
    };

    next();

  } catch (err) {
    console.error('Token verification failed:', err.message);
    return res.status(401).json({ error: 'Unauthorized' });
  }
}

module.exports = { registerClaims, verifyToken, getPendingTasks, getAppointments };