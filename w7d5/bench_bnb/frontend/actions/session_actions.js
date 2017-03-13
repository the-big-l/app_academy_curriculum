// API UTIL
// import { signup, login, logout } from '../util/session_api_util';
import * as APIUtil from '../util/session_api_util';

// CONSTANTS
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

// SYNC ACTIONS
export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})
export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
})

// ASYNC ACTIONS
export const signup = user => dispatch => (
  APIUtil.signup(user)
  .then(user => dispatch(receiveCurrentUser(user)))
  .fail(err => dispatch(receiveErrors(err.responseJSON)))
);

export const login = user => dispatch => (
  APIUtil.login(user)
    .then(user => dispatch(receiveCurrentUser(user)))
    .fail(err => dispatch(receiveErrors(err)))
);

export const logout = () => dispatch => (
  APIUtil.logout()
    .then(user => dispatch(receiveCurrentUser(null)))
)
