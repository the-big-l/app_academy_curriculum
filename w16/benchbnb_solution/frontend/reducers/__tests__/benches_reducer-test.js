/*
  NOTE: Our frontend state shape looks like this:
  {
    benches: {
      1: {
        id: 1,
        description: "...",
        lat: 0.0,
        lng: 0.0
      },
      2: {
        id: 2,
        description: "...",
        lat: 0.0,
        lng: 0.0
      },
      ...
    }
    ...
  }
*/

import BenchesReducer from '../benches_reducer';

// use these benches for your tests
const bench1 = { id: 1, description: "best!", lat: 1.2, lng: 3.4 };
const bench2 = { id: 2, description: "great!", lat: 5.6, lng: 7.8 };

describe('BenchesReducer', () => {

  test('should initialize with an empty object as the default state', () => {
    /* your code here */
  });

  describe('handling the RECEIVE_BENCHES action', () => {
    let action,
        testBenches;

    beforeEach(() => {
      /* assign values to `testBenches` and `action` here */
    });

    test('should replace the state with the action\'s benches', () => {
      /* your code here */
    });

    test('should not modify the old state', () => {
      /* your code here */
    });
  });
});