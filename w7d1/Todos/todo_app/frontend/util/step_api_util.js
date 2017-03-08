export const getSteps = (todoID) => (
  $.ajax({
    method: 'GET',
    url: `api/todos/${todoID}/steps`
  })
);

export const postStep = (step) => (
  $.ajax({
    method: 'POST',
    url: `api/todos/${step.todo_id}/steps`,
    data: {step: step}
  })
);

export const patchStep = (step) => (
  $.ajax({
    method: 'PATCH',
    url: `api/steps/${step.id}`,
    data: {step: step}
  })
);

export const deleteStep = (step) => (
  $.ajax({
    method: 'DELETE',
    url: `api/steps/${step.id}`
  })
);
