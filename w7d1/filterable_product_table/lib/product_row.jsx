import React from 'react';

const ProductRow = ({product: {name, price, stocked}}) => {
  var productName = stocked ?
    name :
    <span style={{color: 'red'}}>{name}</span>;
  return (
    <tr>
      <td>{productName}</td>
      <td>{price}</td>
    </tr>
  );
}

export default ProductRow;
