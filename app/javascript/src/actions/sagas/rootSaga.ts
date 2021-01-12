import { all, call } from 'redux-saga/effects';

import books from './books';

const sagas = [
  ...books,
];

export default function* rootSaga() {
  yield all(sagas.map(saga => call(saga)));
}
