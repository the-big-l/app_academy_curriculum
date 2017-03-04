import React from 'react';
import ReactDOM from 'react-dom';
import Main from './main';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  // ReactDOM.render(<h1>this is a test</h1>, root);
  ReactDOM.render(<Main />, root);
});
