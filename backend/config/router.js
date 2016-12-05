'use strict';

var todo = require(__dirname + '/../controllers/todo');

module.exports = function(router){
	
	//For User
	router.post('/todo/create_account', todo.create_account);



	return router;
};