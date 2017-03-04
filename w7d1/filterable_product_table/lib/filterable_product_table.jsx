import React from 'react';
import SearchBar from 'searchbar';
import ProductTable from 'product_table';

export default class FilterableProductTable extends React.Component {
  render() {
    return (
      <div>
        <SearchBar />
        {/*<ProductTable products={this.props.products} />*/}
      </div>
    );
  }
}
