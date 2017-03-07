import {createStore} from 'redux';
import rootReducer from '../reducers/root_reducer.js';


// why doesn't export const configureStore = () => (createStore(rootReducer));
// work??
const configureStore = () => (createStore(rootReducer));

export default configureStore;
