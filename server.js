require('dotenv').config();
const express = require('express');
const { auth } = require('express-oauth2-jwt-bearer');
const cors = require('cors');
const axios = require('axios'); // added axios
const app = express();
const { registerClaims, verifyToken } = require('./auth/auth.service')
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cors()); // Allow all origins for testing

const backendUrl = process.env.BACKEND_API_URL || 'http://localhost:8000';
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


// Register Claims using email that is added from the Login UI
app.post('/registerClaims', validateToken, async (req, res, next) => {
    try {
        const { email, password, clinicCode } = req.body;

        if (!email || !password || !clinicCode) {
            return res.status(400).json({ error: 'email, password and clinicCode are required' });
        }
        const claims = await registerClaims(email, password, clinicCode);
        return res.status(200).json({ token: claims });

    } catch (err) {
        // Always return the same message — never reveal email-not-found vs wrong-password
        res.status(401).json({ error: 'Invalid credentials' });
    }
});

// app.get('/pendingTasks', verifyToken, async (req, res) => {

//     try {
//         // Call the internal backend service
//         const { data } = await axios.get(`${backendUrl}/get-all-tasks`, {
//             headers: { Authorization: req.headers.authorization }
//         });
//         return res.json(data);
//     } catch (err) {
//         return res.status(err.response?.status || 500).json({ message: "Backend unreachable" });
//     }

// });

app.get('/pendingTasks', verifyToken, async (req, res) => {
    const query = `
    query {
      allTasks {
        id
        title
        description
        status
        due_date
        }
    }
  `;

    try {
        const { data } = await axios.post(
            `${backendUrl}/graphql`,
            { query },
            { headers: { Authorization: req.headers.authorization } }
        );

        if (data.errors) {
            return res.status(500).json({ message: data.errors[0].message });
        }

        return res.json(data.data.allTasks);
    } catch (err) {
        return res.status(err.response?.status || 500).json({ message: "Backend unreachable" });
    }
});


app.get('/appointments', verifyToken, async (req, res) => {

    try {

        // Call the internal backend service
        const { data } = await axios.get(`${backendUrl}/get-all-appointments`, {
            headers: { Authorization: req.headers.authorization }
        });
        return res.json(data);
    } catch (err) {
        return res.status(err.response?.status || 500).json({ message: "Backend unreachable" });
    }
});

app.patch('/appointments/:id/reschedule', verifyToken, async (req, res) => {
    const { id } = req.params;  // ✓ extract id from route
    try {
        const response = await axios.patch(
            `${backendUrl}/appointments/${id}/reschedule`,  // ✓ real id in URL
            req.body,                                       // ✓ body as 2nd arg
            {
                headers: { Authorization: req.headers.authorization }  // ✓ config as 3rd arg
            }
        );

        return res.json(response.data);

    } catch (err) {
        return res.status(err.response?.status || 500).json({
            message: err.response?.data?.message || 'Backend unreachable'
        });
    }
});

