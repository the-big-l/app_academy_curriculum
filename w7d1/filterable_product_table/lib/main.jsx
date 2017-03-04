import React from 'react';
import ReactDOM from 'react-dom';
import FilterableProductTable from './filterable_product_table';

document.addEventListener("DOMContentLoaded", () => {
var PRODUCTS = [
{category: 'Sports', price: '$49.99', stocked: true, name: 'Football'},
{category: 'Sports', price: '$9.99', stocked: true, name: 'Baseball'},
{category: 'Sports', price: '$29.99', stocked: false, name: 'Basketball'},
{category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
{category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
{category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
];
  const root = document.getElementById("root");

  ReactDOM.render(<FilterableProductTable products={PRODUCTS}/>, root);
});
