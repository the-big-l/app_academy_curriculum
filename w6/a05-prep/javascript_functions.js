Function.prototype.spicyCurry = function (numArgs) {
  const args = [];

  const _curriedFunction = (arg) => {
    args.push(arg);

    if (args.length === numArgs) {
      return this(...args);
    } else {
      return _curriedFunction;
    }
  }

  return _curriedFunction;
};

function sum(a, b, c) {
  return a + b + c;
}

console.log('curry:');
var f1 = sum.spicyCurry(3);
var f2 = f1(10);
var f3 = f2(6);
var f4 = f3(5);
console.log(f4 === 21);

function cb(a, b) {
  if (a < b) {
    return -1;
  } else if (a === b) {
    return 0;
  } else if (a > b) {
    return 1;
  }
}

Array.prototype.mergeSort = function (cb) {
  if (this.length <= 1) return this;

  const mid = Math.floor(this.length / 2);

  const left = this.slice(0, mid).mergeSort(cb);
  const right = this.slice(mid).mergeSort(cb);

  return merge(left, right, cb);
};

const merge = function (left, right, cb) {
  if (left.length === 0 || right.length === 0) {
    return left.concat(right);
  }

  if (cb(left[0], right[0]) < 1) {
    return [left.shift()].concat(merge(left, right, cb));
  } else {
    return [right.shift()].concat(merge(left, right, cb));
  }
};

console.log('merge sort:');
var a = [1,5,3,2,4,6];
console.log(`${a.mergeSort(cb)} === ${a.slice(0).sort()}`);

Function.prototype.myBind = function (obj, ...args1) {
  return (...args2) => this.call(obj, ...args1, ...args2);
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true


Array.prototype.quickSort = function (cb) {
  if (this.length <= 1) return this;

  const pivot = this[0];

  const left = [];
  const right = [];

  this.slice(1).forEach(el => {
    if (cb(el, pivot) < 1) {
      left.push(el);
    } else {
      right.push(el);
    }
  });

  return left.concat(pivot, right);
};

console.log(`${a.quickSort(cb)} === ${a.sort()}`);

Array.prototype.bSearch = function (cb, target) {
  if (this.length < 1) return -1;

  const mid = Math.floor(this.length / 2);
  const left = this.slice(0, mid);
  const right = this.slice(mid + 1);
debugger;
  if (cb(target, this[mid]) === 0) {
    return mid;
  } else if (cb(target, this[mid]) === -1) {
    return left.bSearch(cb, target);
  } else if (cb(target, this[mid]) === 1) {
    const rightSearch = right.bSearch(cb, target);
    return (rightSearch === -1) ? -1 : rightSearch + mid + 1;
  }
};

console.log([1,2,3,4,5,6,7].bSearch(cb, 7));

Array.prototype.bubbleSort = function (cb) {
  const that = this.slice(0);
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (var i = 0; i < that.length - 1; i++) {
      if (cb(that[i], that[i + 1]) === 1) {
        sorted = false;
        const temp = that[i];
        that[i] = that[i + 1];
        that[i + 1] = temp;
      }
    }
  }

  return that;
};
console.log('bubbleSort');
var a = [1,5,3,2,4,6];
console.log(a);
a.bubbleSort(cb);
console.log(a);
console.log(`${a.bubbleSort(cb)} === ${a.slice(0).sort()}`);
