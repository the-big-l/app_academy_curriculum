Array.prototype.myEach = function(callback) {
  for(let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

Array.prototype.myMap = function(cb) {
  var mapped = [];
  this.myEach((x) => {
    mapped.push(cb(x));
  })

  return mapped;
}

Array.prototype.myInject = function(initialValue = 0, cb) {
  var accum = initialValue;
  this.myEach((x) => {
    accum = cb(accum, x);
  })

  return accum;
}

Array.prototype.mySelect = function(cb) {
  var selected = [];

  this.myEach((x) => {
    if (cb(x)) {
      selected.push(x);
    }
  })

  return selected;
}

Array.prototype.myCount = function(cb) {
  var count = 0;

  this.myEach((x) => {
    if (cb(x)) {
      count ++;
    }
  })

  return count;
}

Array.prototype.myInclude = function(value) {
  let found = false;

  this.myEach((x) => {
    if (x === value) {
      found = true;
    }
  });

  return found;
}
Array.prototype.myInclude2 = function(value) {
  for (let i = 0; i < this.length; i++) {
    if (this[i] === value) {
      return true;
    }
  }
  return false;
}
