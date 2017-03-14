import React, { Component } from 'react';
import { Link } from 'react-router';

export default class SessionForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
        username: "",
        password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidUpdate() {
  		this.redirectIfLoggedIn();
  	}

  	redirectIfLoggedIn() {
  		if (this.props.loggedIn) {
  			this.props.router.push("/");
  		}
  	}

  handleSubmit(e) {
    e.preventDefault();

    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }

  header() {
    const text = this.props.formType === 'login' ? "Login" : "Sign Up";
    return (
      <h1>{text}</h1>
    );
  }

  footer() {
    const path = this.props.formType === 'login' ? '/signup' : '/login';
    const text = this.props.formType === 'login' ? 'sign up' : 'log in';
    return (
      <p>or {text} <Link to={path}>here</Link></p>
    );
  }

  errors() {
    const errors = this.props.errors.map((err, idx) => (
      <li key={idx}>{err}</li>
    ));

    return (
      <ul>
        {errors}
      </ul>
    );
  }

  render() {
    return (
      <div className='session-form'>
        <form onSubmit={this.handleSubmit}>
          {this.header()}
          {this.footer()}
          <input type='text' onChange={this.update('username')} placeholder='username'/>
          <input type='password' onChange={this.update('password')} placeholder='password'/>
          <button>Submit</button>
          {this.errors()}
        </form>
      </div>
    );
  }
}

// onChange={update('username')}
// onChange={update('password')}
//
