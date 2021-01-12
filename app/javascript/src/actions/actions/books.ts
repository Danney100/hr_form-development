import { Book } from "@/types/book";

// Action Types
export enum BooksActions {
  GET_ALL_BOOKS = 'BOOKS/GET_ALL_BOOKS',
  GET_ALL_BOOKS_SUCCESS = 'BOOKS/GET_ALL_BOOKS_SUCCESS',
  GET_ALL_BOOKS_FAILURE = 'BOOKS/GET_ALL_BOOKS_FAILURE',
}

// Action Interfaces
export interface GetAllBooks {
  type: typeof BooksActions.GET_ALL_BOOKS;
  payload: null;
}

export interface GetAllBooksSuccess {
  type: typeof BooksActions.GET_ALL_BOOKS_SUCCESS;
  payload: {
    data: Book[];
  }
}

export interface GetAllBooksFailure {
  type: typeof BooksActions.GET_ALL_BOOKS_FAILURE;
  payload: {
    error: string;
  }
}

// Action Type List
export type BooksAction = GetAllBooks | GetAllBooksFailure | GetAllBooksSuccess;

// Action Creators
export const getAllBooks = (): BooksAction => ({
  type: BooksActions.GET_ALL_BOOKS,
  payload: null,
});

export const getAllBooksSuccess = (data: Book[]): BooksAction => ({
  type: BooksActions.GET_ALL_BOOKS_SUCCESS,
  payload: {
    data,
  }
});

export const getAllBooksFailure = (error: string): BooksAction => ({
  type: BooksActions.GET_ALL_BOOKS_FAILURE,
  payload: {
    error,
  }
});

