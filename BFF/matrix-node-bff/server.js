const express = require('express');
const cors = require('cors');
const axios = require('axios');
const app = express();
const port = 5000;

// Middleware to parse JSON requests
app.use(express.json());

// Enable CORS for all routes
app.use(cors());

// Import routes
const userRoutes = require('./routes/users');

// Use routes
app.use(userRoutes);

// // Example route to return a dummy response
// app.get('/api/data', (req, res) => {
//   const dummyData = {
//     message: 'This is a dummy response from the BFF',
//     timestamp: new Date().toISOString()
//   };
//   res.json(dummyData);
// });

// Example route to fetch data from the Spring Boot service
app.get('/data', async (req, res) => {
  try {
    const response = await axios.get('http://host.docker.internal:8080/api/data');
    res.json(response.data);
  } catch (error) {
  	console.error('Error fetching data from Spring Boot service:', error.message);
    res.status(500).json({ error: 'Failed to fetch data from Spring Boot service' });
  }
});

// Route to handle login
app.post('/login', async (req, res) => {
  const { username, password } = req.body;
  try {
    const response = await axios.post('http://host.docker.internal:8080/api/login', { username, password });
    res.json(response.data);
  } catch (error) {
    console.error('Error during login:', error.message);
    res.status(500).json({ error: 'Failed to login' });
  }
});

app.listen(port, () => {
  console.log(`BFF server running at http://localhost:${port}`);
});