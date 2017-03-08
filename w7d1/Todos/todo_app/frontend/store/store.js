import {createStore, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer.js';
import thunk from '../middleware/thunk';


// why doesn't export const configureStore = () => (createStore(rootReducer));
// work??
const configureStore = () => (
  createStore(rootReducer, {}, applyMiddleware(thunk))
);

export default configureStore;
