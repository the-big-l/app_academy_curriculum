import { connect } from 'react-redux';
import {
  receiveSteps,
  receiveStep,
  removeStep}
  from '../../actions/step_actions';
import StepList from './step_list';
import {stepsByTodoId} from '../../reducers/selectors';

const mapStateToProps = (state, {todoID}) => {
  return {
    steps: stepsByTodoId(state, todoID),
    todoID
  };
};

const mapDispatchToProps = dispatch => ({
  receiveStep: (step) => dispatch(receiveStep(step)),
  receiveSteps: (steps) => dispatch(receiveSteps(steps)),
  removeStep: (step) => dispatch(removeStep(step))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);
