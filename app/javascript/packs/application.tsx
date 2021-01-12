import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Router } from 'react-router-dom';

import store from '@/actions/configureStore';
import BooksHome from '@/contexts/books/BooksHome';
import history from '@/contexts/app/history';
import 'antd/dist/antd.css'; // or 'antd/dist/antd.less'

document.addEventListener('DOMContentLoaded', () => {
  require('@rails/ujs').start();
  require('@rails/activestorage').start();
  require('channels');

  ReactDOM.render(
    <Provider store={store}>
      <Router history={history}>
        <BooksHome />
      </Router>
    </Provider>,
    document.getElementById('app')
  );
});
