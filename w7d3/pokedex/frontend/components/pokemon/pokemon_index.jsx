import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }
  componentDidMount() {this.props.requestAllPokemon()}

  render() {
    const pokemonItems = this.props.pokemon.map(poke => <PokemonIndexItem key={poke.id} poke={poke} />);
    return (
      <div>
        {this.props.children}
        <ul>
          {pokemonItems}
        </ul>
      </div>
    );
  }
}
