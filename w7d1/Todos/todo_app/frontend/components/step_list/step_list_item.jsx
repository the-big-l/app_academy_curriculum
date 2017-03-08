import React from 'react';
import {merge} from 'lodash';

class StepListItem extends React.Component {

  constructor (props) {
    super(props);
    this.handleRemove = this.handleRemove.bind(this);
    this.handleStatus = this.handleStatus.bind(this);
  }

  handleRemove (e) {
    this.props.removeStep(this.props.step);
  }

  handleStatus(e) {
    const newState = merge({}, this.props.step);
    newState.done = !this.props.step.done;
    this.props.receiveStep(newState);
  }

  statusButtonText() {
    const text = this.props.step.done ? 'UNDO' : 'DONE';
    return text;
  }

  render () {
    return (
      <li className="stepitem">
        <p>{this.props.step.title}</p>
        <p>{this.props.step.body}</p>
        <button onClick={this.handleStatus}>{this.statusButtonText()}</button>
        <button onClick={this.handleRemove}>Remove</button>
      </li>
    );
  }

}


export default StepListItem;
