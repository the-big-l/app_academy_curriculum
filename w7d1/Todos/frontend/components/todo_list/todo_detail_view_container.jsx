import { connect } from 'react-redux';
import {removeTodo} from '../../actions/todo_actions';
import {receiveSteps} from '../../actions/step_actions';
import TodoDetailView from './todo_detail_view';


const mapDispatchToProps = (dispatch, { todo }) => ({
  removeTodo: () => dispatch(removeTodo(todo)),
  receiveSteps: () => dispatch(receiveSteps(todo))
});

export default connect(null, mapDispatchToProps)(TodoDetailView);
