import React from 'react';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }
  componentDidMount() {this.props.requestAllPokemon()}

  render() {
    return (
      <ul>
        {this.props.pokemon.map(poke =>
          <li key={poke.id}>
            {poke.name}
            <img src={poke.image_url} height="70" />
          </li>
        )}
      </ul>
    );
  }
}
