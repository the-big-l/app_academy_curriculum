import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form.jsx';

const TodoList = ({todos, receiveTodo, receiveTodos, removeTodo}) => (
  <div>
    <TodoForm receiveTodo={receiveTodo} receiveTodos={receiveTodos} />
    <ul>
      {todos.map(todo =>
        <TodoListItem
          key={todo.id}
          todo={todo}
          removeTodo={removeTodo}
          receiveTodo={receiveTodo}
        />)}
    </ul>
  </div>
);

export default TodoList;
