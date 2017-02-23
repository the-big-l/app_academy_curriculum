function bubbleSort(array) {
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i + 1 < array.length; i++) {
      if (array[i] > array[i + 1]) {
        sorted = false;

        let temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
      }

    }

  }
  return array;
}

function subStrings(string) {
  let result = [];

  for (var i = 0; i < string.length; i++) {
    for (var j = i + 1; j < string.length + 1; j++) {
      result.push(string.slice(i, j));
    }
  }

  return result;
}
