import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './Welcome.css';

function Welcome({ username, onLogout }) {
  const [userDetails, setUserDetails] = useState([]);

  useEffect(() => {
    const fetchUserDetails = async () => {
      try {
        const response = await axios.post('http://localhost:5000/users/getDetails');
        setUserDetails(response.data);
      } catch (error) {
        console.error('Error fetching user details:', error);
      }
    };

    fetchUserDetails();
  }, []);

  const handleLogout = () => {
    // Clear user data, session, and authentication
    onLogout();
  };

  return (
    <div className="Welcome">
      <header className="Welcome-header">
        <button className="logout-button" onClick={handleLogout}>
          Logout {username}
        </button>
      </header>
      <h1>Hello {username}, welcome to Matrix Revolution</h1>
      <h2>User Details</h2>
      <table>
        <thead>
          <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Mobile No</th>
          </tr>
        </thead>
        <tbody>
          {userDetails.map((user) => (
            <tr key={user.userId}>
              <td>{user.userId}</td>
              <td>{user.username}</td>
              <td>{user.firstName}</td>
              <td>{user.lastName}</td>
              <td>{user.email}</td>
              <td>{user.mobileNo}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Welcome;