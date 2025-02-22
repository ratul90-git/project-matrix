import React, { useState } from 'react';
import axios from 'axios';
import './App.css';
import Login from './Login';
import Welcome from './Welcome';

function App() {
  const [username, setUsername] = useState(null);

  const handleLogin = (username) => {
    setUsername(username);
  };

  return (
    <div className="App">
      <header className="App-header">
        {username ? (
          <Welcome username={username} />
        ) : (
          <Login onLogin={handleLogin} />
        )}
      </header>
    </div>
  );
}

export default App;