import * as Util from '../util/todo_api_util';
import { receiveErrors, clearErrors } from './error_actions';

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

export const receiveTodos = todos => ({
    type: RECEIVE_TODOS,
    todos
});

export const receiveTodo = todo => ({
    type: RECEIVE_TODO,
    todo
});

export const removeTodo = todo => ({
    type: REMOVE_TODO,
    todo
});

export const requestTodos = () => dispatch => {
    return Util.getTodos().then(todos => dispatch(receiveTodos(todos)));
};

export const createTodo = (formTodo) => dispatch => {
    return Util.postTodo(formTodo)
      .then(ajaxTodo => dispatch(receiveTodo(ajaxTodo)))
      .then(dispatch(clearErrors()))
      .fail(err => dispatch(receiveErrors(err.responseJSON)));
};

export const updateTodo = (formTodo) => dispatch => {
    return Util.patchTodo(formTodo)
      .then(ajaxTodo => dispatch(receiveTodo(ajaxTodo)))
      .then(dispatch(clearErrors()))
      .fail(err => dispatch(receiveErrors(err.responseJSON)));
};

export const destroyTodo = (formTodo) => dispatch => {
  return Util.deleteTodo(formTodo)
    .then(ajaxTodo => dispatch(removeTodo(ajaxTodo)));
};
