require('dotenv').config();
const express = require('express');
const { auth } = require('express-oauth2-jwt-bearer');
const cors = require('cors');
const axios = require('axios'); // added axios
const app = express();
const { registerClaims, verifyToken, getPendingTasks, getAppointments } = require('./auth/auth.service')
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); // Allow all origins for testing
const jwt = require('jsonwebtoken');


const PORT = 8080;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`>>> Server is live at http://localhost:${PORT}`);
});

// Create the JWT validation middleware
const validateToken = auth({
    audience: process.env.AUTH0_AUDIENCE,
    issuerBaseURL: `https://${process.env.AUTH0_DOMAIN}/`,
    tokenSigningAlg: "RS256",
});

// app.get('/api/hello', validateToken, async(req, res) => {
//     // res.json({ message: 'Server is WORKING!' });

//     const emailid = req.auth.payload[process.env.AUTH0_AUDIENCE+ '/email'];
//     console.log('email id', emailid);
//     try {
//         const backendUrl = process.env.BACKEND_API_URL || 'http://localhost:8000';
//         console.log('BFF forwarding:', req.headers.authorization);
//         // Call the internal backend service
//         const { data } = await axios.get(`${backendUrl}/get-doctor`, {
//             headers: { Authorization: req.headers.authorization }
//         });
//         return res.json(data);
//     } catch (err) {
//         return res.status(err.response?.status || 500).json({ message: "Backend unreachable" });
//     }
// });

// Use 0.0.0.0 to ensure it listens on all local network interfaces

// Register Claims using email that is added from the Login UI
app.post('/registerClaims', validateToken, async (req, res, next) => {
    try {
        console.log('POST /registerClaims headers:', req.headers);
        console.log('POST /registerClaims body:', req.body);
        const { email, password, clinicCode } = req.body;

        if (!email || !password || !clinicCode) {
            return res.status(400).json({ error: 'email, password and clinicCode are required' });
        }

        const claims = await registerClaims(email, password, clinicCode);
        console.log('typeof claims:', typeof claims);
        return res.status(200).json({ token: claims });
    } catch (err) {
        // Always return the same message — never reveal email-not-found vs wrong-password
        res.status(401).json({ error: 'Invalid credentials' });
    }
});

app.get('/pendingTasks', verifyToken, async (req, res) => {

    const { doctorId, clinicId } = req.user;

    console.log(req.user);
    const tasks = await getPendingTasks(doctorId, clinicId);
    console.log('tasksss', tasks);

    return res.status(200).json({ tasks });
});

app.get('/appointments', verifyToken, async (req, res) => {

    const { doctorId, clinicId } = req.user;

    console.log(req.user);
    const appts = await getAppointments(doctorId, clinicId);
    console.log('appts', appts);

    return res.status(200).json({ appts });
});




// app.get('/api/private-data', validateToken, (req, res) => {
//     // If the code gets here, the token is valid!
//     res.json({
//         message: "This is secure data from Node.js",
//         userId: req.auth.payload.sub // This is the Auth0 User ID
//     });
// });

