import { simpleAddition } from '../number';

describe('simpleAddition', () => {
  describe('if two numbers are passed as function arguments', () => {
    it('returns the sum of the two arguments', () => {
      expect(simpleAddition(1, 2)).toEqual(3);
    });
  });

  describe('if only one number is passed as an argument', () => {
    it('returns the original argument', () => {
      expect(simpleAddition(1)).toEqual(1);
    });
  });
});
