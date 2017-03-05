import React from 'react';
import ProductRow from './product_row';
import ProductCategoryRow from './product_category_row';

const ProductTable = ({products}) => {
  var rows = [];
  var lastCategory = null;

  products.forEach(function(product) {
    if (product.category !== lastCategory) {
      rows.push(<ProductCategoryRow category={product.category} key={product.category} />);
    }
    rows.push(<ProductRow product={product} key={product.name} />);
    lastCategory = product.category;
  });

  return (
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
  );
}

export default ProductTable;
