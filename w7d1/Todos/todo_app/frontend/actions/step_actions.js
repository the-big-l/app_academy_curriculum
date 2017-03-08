import * as Util from '../util/step_api_util';
import {clearErrors, receiveErrors} from './error_actions';

export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";


export const receiveSteps = steps => ({
    type: RECEIVE_STEPS,
    steps
});

export const receiveStep = step => ({
    type: RECEIVE_STEP,
    step
});

export const removeStep = step => ({
    type: REMOVE_STEP,
    step
});

export const requestSteps = () => dispatch => {
    return Util.getSteps().then(steps => dispatch(receiveSteps(steps)));
};

export const createStep = (formStep) => dispatch => {
    return Util.postStep(formStep)
      .then(ajaxStep => dispatch(receiveStep(ajaxStep)))
      .then(dispatch(clearErrors()))
      .fail(err => dispatch(receiveErrors(err.responseJSON)));
};

export const updateStep = (formStep) => dispatch => {
    return Util.patchStep(formStep)
      .then(ajaxStep => dispatch(receiveStep(ajaxStep)))
      .then(dispatch(clearErrors()))
      .fail(err => dispatch(receiveErrors(err.responseJSON)));
};

export const destroyStep = (formStep) => dispatch => {
  return Util.deleteStep(formStep)
    .then(ajaxStep => dispatch(removeStep(ajaxStep)));
};
