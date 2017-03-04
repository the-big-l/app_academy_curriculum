import React from 'react';

const TabHeader = ({ titles, tabClicks }) => (
  <ul className="tab-header">
    {
      titles.map((text, idx) =>
      <li onClick={() => tabClicks(idx)}  key={idx}>{text}</li>
    )
    }
  </ul>
);

export default TabHeader;
