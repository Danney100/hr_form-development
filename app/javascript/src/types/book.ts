import { Nullable } from "./generic";

export interface Book {
  author: string;
  title: string;
}

export interface BookState {
  books: Nullable<Book[]>;
}
