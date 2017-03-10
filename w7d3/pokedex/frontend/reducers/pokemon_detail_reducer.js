import { RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const defaultState = {
  moves: [],
  items: []
};

const pokemonDetailReducer = (state = defaultState, action) => {
  switch (action.type) {
  case RECEIVE_POKEMON:
    return merge({}, state, action.pokemon);
  default:
    return state;
  }
}

export default pokemonDetailReducer;
