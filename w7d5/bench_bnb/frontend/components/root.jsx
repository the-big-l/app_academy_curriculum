import React from 'react';
import {
  Router,
  Route,
  IndexRoute,
  hashHistory} from 'react-router';
  import App from './app';

const Root = (props) => (
  <div>
    <Provider store={props.store}>
      <Router history={hashHistory}>
        <Route path='/' component={App} />
      </Router>
    </Provider>
  </div>
)

export default Root;
