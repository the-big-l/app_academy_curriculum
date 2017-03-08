export const allTodos = (state) => (
  Object.keys(state.todos).map(todoID => state.todos[todoID])
);

export const stepsByTodoId = (state, todoID) => {
  return Object.values(state.steps).filter(step => step.todo_id === todoID);
};
