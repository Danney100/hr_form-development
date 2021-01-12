import { createSelector } from 'reselect';

import { AppState } from '@/types/app';
import { BookState } from '@/types/book';

export const bookState = (state: AppState): BookState => state.books;

export const selectAllBooks = createSelector(bookState, (state) => state.books);
