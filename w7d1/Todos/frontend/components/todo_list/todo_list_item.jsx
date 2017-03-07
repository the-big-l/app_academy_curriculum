import React from 'react';
import {merge} from 'lodash';
import TodoDetailViewContainer from './todo_detail_view_container';
class TodoListItem extends React.Component {

  constructor (props) {
    super(props);
    this.state = {detail: false};

    this.handleStatus = this.handleStatus.bind(this);
    this.toggleDetails = this.toggleDetails.bind(this);
  }

  toggleDetails(e) {
    this.setState({detail: !this.state.detail});
  }

  handleStatus(e) {
    const newState = merge({}, this.props.todo);
    newState.done = !this.props.todo.done;
    this.props.receiveTodo(newState);
  }

  statusButtonText() {
    const text = this.props.todo.done ? 'UNDO' : 'DONE';
    return text;
  }

  render () {
    let steps = '';
    if (this.state.detail) {
      steps = <TodoDetailViewContainer todo= {this.props.todo}/>;
    }
    return (
      <div>
        <li onClick={this.toggleDetails}>{this.props.todo.title}</li>
        <button onClick={this.handleStatus}>{this.statusButtonText()}</button>
        {steps}
      </div>
    );
  }

}

export default TodoListItem;
