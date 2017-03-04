import React from 'react';

class Clock extends React.Component {
  constructor (props) {
    super(props);
    this.state = {date: new Date()};
    this.incrementClock = this.incrementClock.bind(this);
  }

  incrementClock() {
    this.setState({date: new Date});
  }

  componentDidMount() {
    this.incrementID = setInterval(this.incrementClock, 1000);
  }
  componentWillUnmount() {
    this.incrementID.clearInterval();
  }


  render() {
    return (
      <div className = "clock">
        <p>
          <article>Time:</article>
          <article>{this.state.date.toTimeString()}</article>
        </p>
        <p>
          <article>Date:</article>
          <article>{this.state.date.toDateString()}</article>
        </p>
      </div>
    );
  }

}

export default Clock;
