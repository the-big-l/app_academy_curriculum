import React from 'react';
import { Link } from 'react-router';

export default class PokemonDetail extends React.Component {
  componentDidMount() {
    // debugger
    this.props.requestPokemon(this.props.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.params.pokemonId !== newProps.params.pokemonId) {
      this.props.requestPokemon(newProps.params.pokemonId);
    }
  }
  // <ItemDetailContainer itemId= '1' />

  render() {
    const {name, poke_type, attack, defense, moves, items, image_url} = this.props.pokemonDetail;
    const movesString = moves.join(', ');
    const pokemonItems = items.map((item, idx) => {
      let linkUrl = "/pokemon/" + this.props.params.pokemonId + "/item/" + item.id;
      return(
        <Link to={linkUrl} key={idx}>
          <li key={idx}><img src={item.image_url} height="40" /></li>
        </Link>
      );
    });
    // debugger
    return (
      <div className="poke-detail">
        <img src={image_url} height="200" />
        <ul>
          <li><h1>{name}</h1></li>
          <li>Type: {poke_type}</li>
          <li>Attack: {attack}</li>
          <li>Defense: {defense}</li>
          <li>Moves: {movesString}</li>
        </ul>
        <ul>
          {pokemonItems}
        </ul>
        {this.props.children}
      </div>
    );
  }
}
