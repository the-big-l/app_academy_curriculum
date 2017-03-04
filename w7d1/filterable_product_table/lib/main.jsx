import React from 'react';
import ReactDOM from 'react-dom';
import FilterableProductTable from './filterable_product_table';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  // ReactDOM.render(<h1>this is a test</h1>, root);
  ReactDOM.render(<FilterableProductTable />, root);
});
