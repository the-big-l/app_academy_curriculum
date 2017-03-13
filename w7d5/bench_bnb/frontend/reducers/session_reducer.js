import {
  RECEIVE_CURRENT_USER,
  RECEIVE_ERRORS } from '../actions/session_actions';
import merge from 'lodash/merge';

const _nullUser = Object.freeze({
  currentUser: null,
  errors: []
});

const sessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);
  switch (action.type) {
  case RECEIVE_CURRENT_USER:
    return merge({}, _nullUser, action.currentUser);
  case RECEIVE_ERRORS:
    return merge({}, _nullUser, action.errors);
  default:
    return state;
  }
};

export default sessionReducer;
