import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState,
    applyMiddleware(addLoggingToDispatch,quackOnDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

const addLoggingToDispatch = store => next => action => {
  // const d = store.dispatch;
  console.log('Action received:', action);
  console.log('State pre-dispathc:', store.getState());
  let res = next(action);
  console.log('State post-dispathc:', store.getState());
  return res;
}
const quackOnDispatch = store => next => action => {
  console.log("QUUUAAAACCCKKKK!!!!");
  return next(action);
}

export default configureStore;
