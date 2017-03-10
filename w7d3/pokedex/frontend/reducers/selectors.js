export const selectAllPokemon = (state) => (
  Object.values(state.pokemon)
);

export const selectPokemonItem = (state, itemId) => {
  let foundItem;
  state.pokemonDetail.items.forEach(item => {
    if (item.id === itemId) {
      foundItem = item;
    }
  })
  return foundItem;
};
