import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';

import { getAllBooks } from '@/actions/actions/books';
import Button from '@/components/button/Button';
import Sidebar from '@/components/layout/sidebar/Sidebar';
import { selectAllBooks } from '@/selectors/books';
import { Book } from '@/types/book';
import { Layout } from 'antd';
const { Header, Content, Footer } = Layout;

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
    <Layout style={{ minHeight: '100vh' }}>
      <Sidebar />
      <Layout>
        <Header />
        <Content>
          <h1>Books</h1>
          <Button label="Test Button" />
          {renderBooks()}
        </Content>
        <Footer style={{ textAlign: 'center' }}>Demo App ©2021</Footer>
      </Layout>
      
    </Layout>
  );
};

export default BooksHome;
