import { connect } from 'react-redux';
import * as Actions from '../../actions/step_actions';
import StepList from './step_list';
import {stepsByTodoId} from '../../reducers/selectors';

const mapStateToProps = (state, {todoID}) => {
  return {
    steps: stepsByTodoId(state, todoID),
    todoID,
    errors: state.errors
  };
};

const mapDispatchToProps = dispatch => ({
  updateStep: (step) => dispatch(Actions.updateStep(step)),
  createStep: (step) => dispatch(Actions.createStep(step)),
  requestSteps: (todoID) => dispatch(Actions.requestSteps(todoID)),
  destroyStep: (step) => dispatch(Actions.destroyStep(step))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);
