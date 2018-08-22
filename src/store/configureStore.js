import { createStore, combineReducers, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import { composeWithDevTools } from 'redux-devtools-extension';
import authReducer from '../reducers/auth';

const store = createStore(
	combineReducers({
		auth: authReducer,
	}),
	composeWithDevTools(applyMiddleware(thunk)),
);

export default () => store;
