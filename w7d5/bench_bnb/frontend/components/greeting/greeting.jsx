import React from 'react';
import { Link } from 'react-router';

const userInfo = (currentUser, logout) => (
  <div className='greeting'>
    <p>Welcome, {currentUser.username}</p>
    <button onClick={logout}>logout</button>
  </div>
);

const loginMethod = () => (
  <ul className='login-method'>
    <li><Link to='/signup'>Sign up!</Link></li>
    <li><Link to='/login'>Login!</Link></li>
  </ul>
);

const Greeting = ({ currentUser, logout }) => (
  <div className='right-header-bar'>
    {currentUser ? userInfo(currentUser, logout) : loginMethod()}
  </div>
);

export default Greeting;
