'use strict';

var todo = require(__dirname + '/../controllers/todo');

module.exports = function(router){
	
	//For User
	router.post('/todo/sign_in', todo.sign_in);
	router.post('/todo/create_account', todo.create_account);
	router.post('/todo/sign_out', todo.sign_out);
	router.get('/todo/get_tweets', todo.get_tweets);

	return router;
};