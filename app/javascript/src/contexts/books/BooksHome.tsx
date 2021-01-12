import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';

import { getAllBooks } from '@/actions/actions/books';
import Button from '@/components/button/Button';
import { selectAllBooks } from '@/selectors/books';
import { Book } from '@/types/book';

const BooksHome = (): JSX.Element => {
  const dispatch = useDispatch();

  const allBooks = useSelector(selectAllBooks);

  useEffect(() => {
    dispatch(getAllBooks());
  }, []);

  const renderBooks = () => {
    if (allBooks) {
      return allBooks.map((book: Book) => (
        <p key={`${book.title}_${book.author}`}>
          {book.title} by {book.author}
        </p>
      ));
    }
  };

  return (
    <div>
      <h1>Books</h1>
      <Button label="Test Button" />
      {renderBooks()}
    </div>
  );
};

export default BooksHome;
