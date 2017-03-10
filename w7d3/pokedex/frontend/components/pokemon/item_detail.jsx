import React from 'react';

const ItemDetail = (props) => {
  if (selectedItem === undefined) {
    return (<div></div>);
  }
  return (
    <ul>
      <li>Name: {selectedItem.name}</li>
      <li>Happinness: {selectedItem.happinness}</li>
      <li>Price: {selectedItem.price}</li>
    </ul>
  );
}

export default ItemDetail;
