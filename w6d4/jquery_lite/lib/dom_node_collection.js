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
    }
  }

  _domToDom(nodes) {
    this.collection.forEach(el => {
      nodes.collection.forEach(node => {
        el.appendChild(node);
      });
    });
  }

}

module.exports = DomNodeCollection;
