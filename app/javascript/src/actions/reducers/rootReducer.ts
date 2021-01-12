import { combineReducers } from 'redux';

import AppState from '@/types/app';
import books from './books';

const allReducers = combineReducers({
  books,
});

const rootReducer = (state: AppState, action: any) => {
  return allReducers(state, action);
};

export default rootReducer;
