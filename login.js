// const express = require('express');
// const app = express();
// const { login } = require('./auth/auth.service')

// app.post('/login'), async (req, res, next) => {
//    try {
//     const { email, password, clinicCode } = req.body;

//     if (!email || !password || !clinicCode) {
//       return res.status(400).json({ error: 'email, password and clinicCode are required' });
//     }

//     const { token } = await login(email, password, clinicCode);
//     res.json({ token });
//   } catch (err) {
//     // Always return the same message — never reveal email-not-found vs wrong-password
//     res.status(401).json({ error: 'Invalid credentials' });
//   } 
// }
