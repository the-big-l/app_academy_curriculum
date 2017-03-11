import React from 'react';
import ReactDOM from 'react-dom';

// Testing
import * as Util from './util/session_api_util';

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');

    // Testing
    window.login = Util.login;
    window.signup = Util.signup;
    window.logout = Util.logout;

    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
