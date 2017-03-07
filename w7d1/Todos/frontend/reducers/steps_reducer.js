import {
  RECEIVE_STEPS,
  RECEIVE_STEP,
  REMOVE_STEP
}
 from "../actions/step_actions.js";
import merge from 'lodash/merge';

const seedData = {
  '1': {
    id: 1,
    title: "buy soap",
    body: "with money",
    done: false,
    todo_id: 1
  },
  '2': {
    id: 2,
    title: "spray car",
    body: "with water",
    done: true,
    todo_id: 1
  },
};

const stepsReducer = (state = seedData, action) => {
  const newState = merge({}, state);
  switch(action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach ((step) => {
        newState[step.id] = step;
      });
      return newState;
    case RECEIVE_STEP:
      newState[action.step.id] = action.step;
      return newState;
    case REMOVE_STEP:
      delete newState[action.step.id];
      return newState;
    default:
      return state;
  }
};

export default stepsReducer;
