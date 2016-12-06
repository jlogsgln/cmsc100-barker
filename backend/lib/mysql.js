const mysql = require('mysql');

const obj = {
	host: 'localhost',
	user: 'root',
	password: 'admin',
	database: 'barker'
};

module.exports = mysql.createConnection(obj);