'use strict';

var db = require(__dirname + '/../lib/mysql');

exports.sign_in = function(req, res, next){
	console.log(req.query);

	var query_string = 'SELECT * FROM User WHERE user_handle=? && password=?';
	var request_data = [req.query.handle, req.query.password];

	db.query(query_string, request_data, function(err, result){
		if(err){
			console.log(err);
			return res.status(500).send(err);
		}else{
			if(result.length != 0){
				console.log("Successfully logged-in");
				req.session.user = {
					fullname: result[0].user_full_name,
					username: result[0].user_handle,
					password: result[0].password
				};
				return res.send(req.session.user);
			}
			else{
				return res.send({value: 0, message: 'Please try again!'});
			}
		}
	});
};

exports.create_account = function(req, res, next){

	console.log(req.query);
	var query_string = 'INSERT INTO User(user_full_name, user_handle, password, email, followers) VALUES(?,?,?,?,?)';
	var request_data = [req.query.fullname, req.query.email, req.query.handle, req.query.password];

	db.query(query_string, request_data, function(err, result){
		if(err){
			console.log("1");
			console.log(err);
			return res.status(500).send(err);
		}else{
			return res.send({message: 'Account created successfully!'});
		}
	});
};


exports.sign_out = function(req, res, next){
	req.session.destroy(function(err) {
	  if(err) {
	    console.log(err);
	  } else {
	    return res.send({message: 'Account looged out successfully!'});
	  }
	});
	
};