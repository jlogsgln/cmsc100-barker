const mysql = require('mysql');

const obj = {
	host: 'localhost',
	user: 'root',
	password: 'johnlouismatalino',
	database: 'twitter'
};

module.exports = mysql.createConnection(obj);