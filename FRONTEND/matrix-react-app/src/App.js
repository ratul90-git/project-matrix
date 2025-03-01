import React, { useState } from 'react';
import './App.css';
import Login from './Login';
import Welcome from './Welcome';

function App() {
  const [username, setUsername] = useState(null);

  const handleLogin = (username) => {
    setUsername(username);
  };

  const handleLogout = () => {
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