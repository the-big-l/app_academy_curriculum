class DomNodeCollection {
  constructor(collection) {
    this.collection = collection;
  }

  html(string) {
    if (string !== undefined) {
      this.collection.forEach(el => el.innerHTML = string);
    } else {
      return this.collection[0].innerHTML;
    }
  }

  empty() {
    this.html('');
  }

  append(element) {
    if (element instanceof DomNodeCollection) {
      this._domToDom(element);
    } else if (element instanceof HTMLElement) {
      this._htmlToDom(element);
    } else if (typeof element === 'string') {
      this._appendText(element);
    }
  }

  addClass(className) {
    this.collection.forEach(el => {
      el.classList.add(className);
    })
  }

  removeClass(className) {
    this.collection.forEach(el => {
      el.classList.remove(className);
    })
  }

  _domToDom(nodes) {
    this.collection.forEach(el => {
      nodes.collection.forEach(node => {
        el.appendChild(node);
      });
    });
  }

  _htmlToDom(element) {
    this._domToDom(new DomNodeCollection([element]));
  }

  _appendText(element) {
    this.collection.forEach(el => {
      const inner = el.innerHTML;
      el.innerHTML = inner + element;
    });
  }

}

module.exports = DomNodeCollection;
