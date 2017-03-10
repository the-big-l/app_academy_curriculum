import React from 'react';
import { Link } from 'react-router';


const PokemonIndexItem = ({poke}) => {
  const urlStr = "/pokemon/" + poke.id;
  return (
    <Link to={urlStr} key={poke.id}>
      <li>
        {poke.name}
        <img src={poke.image_url} height="70" />
      </li>
    </Link>
  )
};

export default PokemonIndexItem;
