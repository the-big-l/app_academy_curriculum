import {
  RECEIVE_ERRORS,
  CLEAR_ERRORS
}
 from "../actions/error_actions.js";
import merge from 'lodash/merge';

const errorsReducer = (state = [], action) => {
  switch (action.type) {
  case RECEIVE_ERRORS:
    return action.errors;
  case CLEAR_ERRORS:
    return [];
  default:
    return [];
  }
};

export default errorsReducer;
