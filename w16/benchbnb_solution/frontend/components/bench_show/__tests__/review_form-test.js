import React from 'react';
import thunk from 'redux-thunk';
import configureMockStore from 'redux-mock-store';
import { mount } from 'enzyme';
import ReviewFormContainer from '../review_form_container';

const bench = { id: 1, description: "great!", lat: 1.2, lng: 3.4 };
const middlewares = [ thunk ];
const mockStore = configureMockStore(middlewares);
const testStore = mockStore({ benches: { [bench.id]: bench } });

describe('review form container', () => {
  let reviewFormWrapper,
      reviewRating,
      reviewBody;

  describe('creating a new review', () => {
    beforeEach(() => {
      reviewFormWrapper = mount(
        <ReviewFormContainer store={testStore} />
      ).find('ReviewForm');

      reviewRating = reviewFormWrapper.find('input').filterWhere(input => (
        input.props().type === 'number'
      ));

      reviewBody = reviewFormWrapper.find('textarea');

    });

    test('pre-fills rating field to 5', () => {
      expect(reviewRating.props().value).toEqual(5)
    });

    test('pre-fills comment field with empty string', () => {
      expect(reviewBody.props().value).toEqual('')
    });

    test('changes rating on change', () => {
      reviewRating.simulate('change', { target: { value: '2' } })
      expect(reviewFormWrapper.node.state.rating).toEqual('2')
    })
  });

});
