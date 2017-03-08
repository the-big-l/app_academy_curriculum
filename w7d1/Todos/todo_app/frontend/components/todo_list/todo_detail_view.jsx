import React from 'react';
import StepListContainer from '../step_list/step_list_container';


class TodoDetailView extends React.Component {

  render() {
    const { todo, destroyTodo } = this.props;
    return (
      <div>
        <p>{todo.body}</p>
        <StepListContainer todoID={todo.id}/>
        <button onClick={destroyTodo}>Remove Todo</button>
      </div>

    );
  }
}

export default TodoDetailView;
