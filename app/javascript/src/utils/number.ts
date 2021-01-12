export const simpleAddition = (a: number, b?: number): number => {
  if (!b) {
    return a;
  }

  return a + b;
};
