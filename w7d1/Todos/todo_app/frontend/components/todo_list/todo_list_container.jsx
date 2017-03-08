import { connect } from 'react-redux';
import * as Actions from '../../actions/todo_actions';
import TodoList from './todo_list';
import {allTodos} from '../../reducers/selectors';


const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  updateTodo: (todo) => dispatch(Actions.updateTodo(todo)),
  createTodo: (todo) => dispatch(Actions.createTodo(todo)),
  requestTodos: () => dispatch(Actions.requestTodos()),
  receiveTodos: (todos) => dispatch(Actions.receiveTodos(todos)),
  destroyTodo: (todo) => dispatch(Actions.destroyTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
