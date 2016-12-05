const mysql = require('mysql');

const obj = {
	host: 'localhost',
	user: 'root',
	password: 'johnlouismatalino',
	database: 'barker'
};

module.exports = mysql.createConnection(obj);