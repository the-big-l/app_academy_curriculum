import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// test
import { fetchPokemon } from './util/api_util';
import { requestPokemon } from './actions/pokemon_actions';
import { selectPokemonItem } from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');

  // test
  window.fetchPokemon = fetchPokemon;
  window.requestPokemon = requestPokemon;
  window.selectPokemonItem = selectPokemonItem;

  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={store} />, rootEl);
});
