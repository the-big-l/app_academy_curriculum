Array.prototype.uniq = function() {
  let uniques = [];

  for(let i = 0; i < this.length; i++) {
    let number = this[i];

    if (uniques.indexOf(number) === -1) {
      uniques.push(number);
    }
  }

  return uniques;
}
let a = [1, 2, 1, 3, 3];
console.log(a.uniq());

Array.prototype.two_sum = function() {
  let pairs = [];

  for(let i = 0; i < this.length; i++) {
    for(let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }

  return pairs;
}
[-1, 0, 2, -2, 1].two_sum();

Array.prototype.myTranspose = function() {
  let result = [];

  for(let i = 0; i < this.length; i ++) {
    result.push([]);
  }

  for(let i = 0; i < this.length; i ++) {
    for(let j = 0; j < this.length; j++) {
      result[j].push(this[i][j]);
    }
  }

  return result;
}
