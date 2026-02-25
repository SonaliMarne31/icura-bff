---
--- 1. CLINICS
---
CREATE TABLE clinics (
    id VARCHAR(50) PRIMARY KEY ,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(50) UNIQUE NOT NULL,
    timezone VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

---
--- 2. CLINIC_CONFIG
---
CREATE TABLE clinic_config (
    id VARCHAR(50) PRIMARY KEY ,
    clinic_id VARCHAR(50) NOT NULL REFERENCES clinics(id) ON DELETE CASCADE,
    opening_hours JSONB NOT NULL,
    slot_duration_minutes INT NOT NULL,
    allow_overbooking BOOLEAN DEFAULT false,
    appointment_rules JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

---
--- 3. DOCTORS
---
CREATE TABLE doctors (
    id VARCHAR(50) PRIMARY KEY ,
    clinic_id VARCHAR(50) NOT NULL REFERENCES clinics(id),
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone VARCHAR(20),
    status VARCHAR(50) CHECK (status IN ('active', 'inactive')) DEFAULT 'active',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

---
--- 4. DOCTOR_CONFIG
---
CREATE TABLE doctor_config (
    id VARCHAR(50) PRIMARY KEY ,
    clinic_id VARCHAR(50) NOT NULL REFERENCES clinics(id),
    doctor_id VARCHAR(50) NOT NULL REFERENCES doctors(id) ON DELETE CASCADE,
    working_hours JSONB,
    default_timezone VARCHAR(100),
    slot_duration_minutes INT,
    allowed_appointment_types TEXT[],
    notification_preferences JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

---
--- 5. PATIENTS
---
CREATE TABLE patients (
    id VARCHAR(50) PRIMARY KEY ,
    clinic_id VARCHAR(50) NOT NULL REFERENCES clinics(id),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    dob DATE,
    phone VARCHAR(20),
    email VARCHAR(255),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

---
--- 6. APPOINTMENTS
---
CREATE TABLE appointments (
    id VARCHAR(50) PRIMARY KEY ,
    clinic_id VARCHAR(50) NOT NULL REFERENCES clinics(id),
    doctor_id VARCHAR(50) NOT NULL REFERENCES doctors(id),
    patient_id VARCHAR(50) NOT NULL REFERENCES patients(id),
    appointment_type VARCHAR(100),
    status VARCHAR(50) CHECK (status IN ('scheduled', 'completed', 'cancelled', 'no_show')) DEFAULT 'scheduled',
    reason TEXT,
    notes TEXT,
    start_time TIMESTAMPTZ NOT NULL,
    end_time TIMESTAMPTZ NOT NULL,
    timezone VARCHAR(100) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

---
--- 7. TASKS
---
CREATE TABLE tasks (
    id VARCHAR(50) PRIMARY KEY ,
    clinic_id VARCHAR(50) NOT NULL REFERENCES clinics(id),
    doctor_id VARCHAR(50) NOT NULL REFERENCES doctors(id),
    title VARCHAR(255),
    description TEXT,
    status VARCHAR(50) CHECK (status IN ('pending', 'completed')) DEFAULT 'pending',
    due_date TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);