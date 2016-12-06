'use strict';

var todo = require(__dirname + '/../controllers/todo');

module.exports = function(router){
	
	//For User
	router.post('/todo/sign_in', todo.sign_in);
	router.post('/todo/create_account', todo.create_account);
	router.post('/todo/sign_out', todo.sign_out);
	router.get('/todo/get_tweets', todo.get_tweets);
	router.get('/todo/get_logged', todo.get_logged);
	router.get('/todo/get_logged_info', todo.get_logged_info);
	router.post('/todo/post_tweet', todo.post_tweet);
	

	return router;
};