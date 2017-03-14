import React from 'react';
import { Provider } from 'react-redux';
import {
  Router,
  Route,
  IndexRoute,
  hashHistory } from 'react-router';
  import App from './app';
  import SessionFormContainer from './session/session_form_container';

const Root = (props) => {
  const _redirectIfLoggedIn = () => {
    if (props.store.getState().session.currentUser) {
      hashHistory.replace('/')
    }
  };

  return (
    <div>
      <Provider store={props.store}>
        <Router history={hashHistory}>
          <Route path='/' component={App} />
          <Route
            path='/login'
            component={SessionFormContainer}
            onEnter={_redirectIfLoggedIn}
            />
          <Route
            path='/signup'
            component={SessionFormContainer}
            onEnter={_redirectIfLoggedIn}
            />
        </Router>
      </Provider>
    </div>
  );
}

export default Root;
