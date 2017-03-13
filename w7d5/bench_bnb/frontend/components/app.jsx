import React from 'react';

const App = (props) => (
  <div className='app'>
    <h1>Bench BnB</h1>
    {props.children}
  </div>
);

export default App;
