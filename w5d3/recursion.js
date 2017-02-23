function rangeRecursion(start, end) {
  if (end < start) return [];

  let x = range(start, end - 1);
  x.push(end);
  return x;
}

function rangeIterative(start, end) {
  var range_nums = [];

  for(let i = start; i <= end; i++) {
    range_nums.push(i);
  }

  return range_nums;
}

function exponentOne(base, exp) {
  if (exp === 0) return 1;

  return base * exponentOne(base, exp - 1);
}

function exponentTwo(base, exp) {
  if (exp === 0) return 1;

  if (exp % 2 === 0) {
    return Math.pow(exponentTwo(base, exp / 2), 2);
  } else {
    return base * exponentTwo(base, exp - 1);
  }
}

function fibNumbers(n) {
  if (n === 0) return [];
  if (n === 1) return [0];
  if (n === 2) return [0, 1];

  let fibs = fibNumbers(n - 1);

  fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2]);

  return fibs;
}

function bSearch(array, target) {
  if (array.length < 1) {
    return null;
  }

  let mid = Math.floor(array.length / 2);

  let left = array.slice(0, mid);
  let right = array.slice(mid + 1);

  if (target === array[mid]) {
    return mid;
  } else if (target < array[mid]) {
    return bSearch(left, target);
  } else {
    var search_result = bSearch(right, target);
    if (search_result === null) {
      return null;
    } else {
      return search_result + mid + 1;
    }
  }
}

function mergeSort(array) {
  if (array.length <= 1) return array;

  let mid = Math.floor(array.length / 2);

  let left = array.slice(0, mid);
  let right = array.slice(mid);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  if (left.length === 0 || right.length === 0) return left.concat(right);

  if (left[0] < right[0]) {
    let firstl = left.shift();
    return [firstl].concat(merge(left, right));
  } else {
    let firstr = right.shift();
    return [firstr].concat(merge(left, right));
  }
}

//INCOMPLETE
function subsets(array) {
  if (array.length === 0) return [[]];
  var result = [];
  var last = array.pop();

  var subset = subsets(array);

  subset.forEach(function(subarray) {
    result.push(subarray);
    result.push(subarray.push(last));
  });

  return result;
}
