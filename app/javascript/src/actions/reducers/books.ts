import { BooksActions } from '@/actions/actions/books';
import { BookState } from '@/types/book';

const initialState: BookState = {
  books: null,
};

export default function reducer(
  state: BookState = initialState,
  action: any,
): BookState {
  const { type, payload } = action;

  switch (type) {
    case BooksActions.GET_ALL_BOOKS_SUCCESS:
      return {
        ...state,
        books: payload.data
      }

    default:
      return state;
  }
}
