import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form.jsx';

class TodoList extends React.Component {
  componentDidMount() {
    this.props.requestTodos();
  }

  render() {

    const {todos, createTodo, destroyTodo, updateTodo, errors} = this.props;

    return (
      <div className="todo-form">
        <h1>YOU GOT SHIT TO DO</h1>
        <div className="form">
          <TodoForm createTodo={createTodo} errors={errors} />
        </div>
        <ul>
          {todos.map(todo =>
            <TodoListItem
              key={todo.id}
              todo={todo}
              destroyTodo={destroyTodo}
              updateTodo={updateTodo}
            />)}
        </ul>
      </div>
    );
  }
}

export default TodoList;
