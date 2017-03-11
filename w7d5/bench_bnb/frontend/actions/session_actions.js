export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
})
export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
})

export const login = (user) =>
export const logout = () =>
export const signup = (user) =>
