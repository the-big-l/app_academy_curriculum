import { connect } from 'react-redux';
import {
  receiveTodos,
  receiveTodo,
  removeTodo}
  from '../../actions/todo_actions';
import TodoList from './todo_list';
import {allTodos} from '../../reducers/selectors';


const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  receiveTodos: (todos) => dispatch(receiveTodos(todos)),
  removeTodo: (todo) => dispatch(removeTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
