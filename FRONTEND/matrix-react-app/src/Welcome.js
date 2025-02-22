import React from 'react';
import './Welcome.css';

function Welcome({ username }) {
  return (
    <div className="Welcome">
      <h1>Hello {username}, welcome to Matrix Revolution</h1>
    </div>
  );
}

export default Welcome;