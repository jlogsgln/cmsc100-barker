'use strict';

var db = require(__dirname + '/../lib/mysql');

exports.create_account = function(req, res, next){

	console.log(req.query);
	var query_string = 'INSERT INTO user values(?, ?, ?, ?)';
	var request_data = [req.query.fullname, req.query.email, req.query.username, req.query.password];

	db.query('SELECT username FROM user WHERE username=?', req.query.username, function(err, result){
		if(err){
			console.log(err);
			return res.status(500).send(err);
		}else{
			db.query(query_string, request_data, function(err, result){
				if(err){
					console.log(err);
					return res.status(500).send(err);
				}else{
					return res.send({message: 'Account created successfully!'});
				}
			});
		}	
	});
};


// req.session.user = {
// 	username: res[0].user
// }