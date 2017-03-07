import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import allTodos from './reducers/selectors';
import Root from './components/root.jsx';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store = { store }/>, root);
});

window.allTodos = allTodos;
