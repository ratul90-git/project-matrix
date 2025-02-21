const express = require('express');
const axios = require('axios');
const app = express();
const port = 5000;

// Middleware to parse JSON requests
app.use(express.json());

// Example route to return a dummy response
app.get('/api/data', (req, res) => {
  const dummyData = {
    message: 'This is a dummy response from the BFF',
    timestamp: new Date().toISOString()
  };
  res.json(dummyData);
});

app.listen(port, () => {
  console.log(`BFF server running at http://localhost:${port}`);
});