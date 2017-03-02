const DomNodeCollection = require('./dom_node_collection.js');

window.$l = function (arg) {
  if (arg instanceof HTMLElement) {
    return new DomNodeCollection([arg])
  } else {
    return selectElements(arg);
  }
};

function selectElements(arg) {
  const array = Array.from(document.querySelectorAll(arg));
  return new DomNodeCollection(array);
}
