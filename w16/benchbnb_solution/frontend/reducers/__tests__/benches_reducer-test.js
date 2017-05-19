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
    expect(BenchesReducer(undefined, {})).toEqual({})
  });

  describe('handling the RECEIVE_BENCHES action', () => {
    let action,
        testBenches;

    beforeEach(() => {
      testBenches = { [bench1.id]: bench1, [bench2.id]: bench2 }

      action = {
        type: 'RECEIVE_BENCHES',
        benches: testBenches
      }
    });

    test('should replace the state with the action\'s benches', () => {
      const state = BenchesReducer(undefined, action)
      expect(state).toEqual(testBenches)
    });

    test('should not modify the old state', () => {
      let oldState = { 1: 'oldState' }
      BenchesReducer(oldState, action)
      expect(oldState).toEqual({ 1: 'oldState' })
    });
  });
});
