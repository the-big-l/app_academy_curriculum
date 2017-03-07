export const allTodos = (state) => (
  Object.keys(state.todos).map(todoID => state.todos[todoID])
);

export const stepsByTodoId = (state, todoID) => {
  return Object.keys(state.steps).map(
    step => {
      if (step.todo_id === todoID) {
        return step;
      }
    }
  );
};
