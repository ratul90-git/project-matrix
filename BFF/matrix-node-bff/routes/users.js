const express = require('express');
const axios = require('axios');
const router = express.Router();

router.post('/users/getDetails', async (req, res) => {
  try {
    const response = await axios.post('http://host.docker.internal:8081/api/users/getDetails');
    res.json(response.data);
  } catch (error) {
    console.error('Error fetching user details:', error.message);
    res.status(500).json({ error: 'Failed to fetch user details' });
  }
});

module.exports = router;