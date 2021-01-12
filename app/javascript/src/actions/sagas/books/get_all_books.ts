import { call, put, takeLatest } from 'redux-saga/effects';

import { BooksActions, GetAllBooks, getAllBooksFailure, getAllBooksSuccess } from '@/actions/actions/books';
import Api from '@/api/Api';

export function* getAllBooksSaga(
  _action: GetAllBooks,
) {
  try {
    // const url = 'api/v1/books';
    const url = 'api/';

    const response = yield call(Api.utility.get, url);

    yield put(getAllBooksSuccess(response.data));
  } catch (err) {
    yield put(getAllBooksFailure(err));
  }
}

export function* watchGetAllBooks() {
  yield takeLatest(BooksActions.GET_ALL_BOOKS, getAllBooksSaga);
}
