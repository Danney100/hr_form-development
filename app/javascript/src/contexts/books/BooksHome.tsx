import React, { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';

import { getAllBooks } from '@/actions/actions/books';
import Button from '@/components/button/Button';
import SidebarMobile from '@/components/layout/sidebar-mobile/sidebar-mobile';
import Header from '@/components/layout/header/header';
import SidebarDesktop from '@/components/layout/sidebar-desktop/sidebar-desktop';

import { selectAllBooks } from '@/selectors/books';
import { Book } from '@/types/book';
import { Layout, Row, Col } from 'antd';
const { Content } = Layout;

const BooksHome = (): JSX.Element => {
  const dispatch = useDispatch();

  const allBooks = useSelector(selectAllBooks);

  useEffect(() => {
    dispatch(getAllBooks());
  }, []);

  const [width, setWidth] = useState(window.outerWidth);

  useEffect(() => {
    const onHandleResize = (e) => {
      setWidth(e.target.outerWidth);
    }
    window.addEventListener('resize', onHandleResize, true)
    return () => {
      window.removeEventListener('resize', onHandleResize, true);
    }
  })

  const renderBooks = () => {
    if (allBooks) {
      return allBooks.map((book: Book) => (
        <p key={`${book.title}_${book.author}`}>
          {book.title} by {book.author}
        </p>
      ));
    }
  };

  const isMobile = width < 500
  return (
    <>
      <Layout style={{ minHeight: '100vh', background: '#f8f9fa' }}>
        {isMobile ? (
          <>
            <SidebarMobile />
            <div style={{ 
              textAlign: 'center', 
              position:'absolute', 
              bottom:0, 
              width:'100%' 
            }}>
              <Button width="224px" label="LOG OUT" />
            </div>
          </>
        ) : (
          <Layout>
            <Header />
            <Layout>
              <SidebarDesktop />
              <Content style={{background: "#f8f9fa"}}>
                <div style={{background: "#00345d", padding:"10px"}}>
                  <Row>
                    <Col span={6} style={{textAlign:'center'}}>
                      <h1 style={{color:"white", margin: 0}}>PACKET NAME</h1>
                    </Col>
                    <Col span={18} style={{display: 'flex', justifyContent: 'flex-end'}}>
                      <Button label="PRINT FORMS" width="176px" backgroundColor="white" customClass="ml-5"/>
                      <Button label="DENY PACKET" width="176px" backgroundColor="white" customClass="ml-5"/>
                      <Button label="APPROVE PACKET" width="176px" backgroundColor="white" customClass="ml-5 mr-15"/>
                    </Col>
                  </Row>
                </div>
              </Content>
            </Layout>
          </Layout>
        )}
      </Layout>
    </>
  );
};

export default BooksHome;
