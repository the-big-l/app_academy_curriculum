document.addEventListener("DOMContentLoaded", () => {

document.querySelectorAll('li').forEach(li => {
  li.addEventListener('click', e => {
    const newLocation = e.currentTarget.innerText.toLowerCase();
    window.location.hash = newLocation;
  });
});

//   In the callback, add an click event listener for each .sidebar-nav li that does the following:
// Gets the innerText of the element; this will be our new location.
// Call toLowerCase on the name to make sure there aren't case differences.
// Set window.location.hash to the lower-cased location name.
});
