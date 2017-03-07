import React from 'react';
import StepListContainer from '../step_list/step_list_container';


class TodoDetailView extends React.Component {

  render() {
    const { todo, removeTodo } = this.props;
    return (
      <div>
        <p>{todo.body}</p>
        <StepListContainer todoID={todo.id}/>
        <button onClick={removeTodo}>Remove Todo</button>
      </div>

    );
  }
}

export default TodoDetailView;
