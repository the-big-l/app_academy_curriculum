import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import stepsReducer from './steps_reducer';
import errorsReducer from './errors_reducer';

export default combineReducers({
  todos: todosReducer,
  steps: stepsReducer,
  errors: errorsReducer
});
