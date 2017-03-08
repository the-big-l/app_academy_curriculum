import React from 'react';
import {merge} from 'lodash';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    this.handleSubmit= this.handleSubmit.bind(this);
  }

  updateState(key) {
    return e => this.setState({[key]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.createTodo(this.state).then(
      () => this.setState({title: '', body: ''})
    );
  }

  render() {
    return (
      <div>
        <label>Title:
          <input
            onChange={this.updateState('title')}
            type="text"
            value={this.state.title}>
          </input>
        </label>
        <label>Body:
          <textarea
            onChange={this.updateState('body')}
            value={this.state.body}>
          </textarea>
        </label>
        <button onClick={this.handleSubmit}>Create Todo</button>
        <div className="todo-errors">{this.props.errors}</div>
      </div>
    );
  }

}

export default TodoForm;
