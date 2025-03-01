import React, { useState, useEffect } from 'react';
import './App.css';
import Login from './Login';
import Welcome from './Welcome';

function App() {
  const [username, setUsername] = useState(null);

  useEffect(() => {
    const storedUsername = sessionStorage.getItem('username');
    if (storedUsername) {
      setUsername(storedUsername);
    }
  }, []);

  const handleLogin = (username) => {
    sessionStorage.setItem('username', username);
    setUsername(username);
  };

  const handleLogout = () => {
    sessionStorage.removeItem('username');
    setUsername(null);
  };

  return (
    <div className="App">
      <header className="App-header">
        {username ? (
          <Welcome username={username} onLogout={handleLogout} />
        ) : (
          <Login onLogin={handleLogin} />
        )}
      </header>
    </div>
  );
}

export default App;