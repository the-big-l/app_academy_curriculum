import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

// Testing
import * as Util from './util/session_api_util';
import {receiveCurrentUser} from './actions/session_actions';

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root');

    // Testing
    window.login = Util.login;
    window.signup = Util.signup;
    window.logout = Util.logout;
    window.store = configureStore();
    window.receiveCurrentUser = receiveCurrentUser;


    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});
