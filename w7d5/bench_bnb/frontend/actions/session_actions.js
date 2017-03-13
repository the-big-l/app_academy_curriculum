// API UTIL
import { signup, login, logout } from '../util/session_api_util';

// CONSTANTS
export const LOGIN = "LOGIN";
export const LOGOUT = "LOGOUT";
export const SIGNUP = "SIGNUP";
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

// SYNC ACTIONS
export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})
export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
})

// ASYNC ACTIONS
export const login = (user) => {
  return (dispatch)
}
export const logout = () =>
export const signup = (user) =>
