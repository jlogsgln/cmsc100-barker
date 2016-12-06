const mysql = require('mysql');

const obj = {
	host: 'localhost',
	user: 'root',
	password: 'root',
	database: 'barker'
};

module.exports = mysql.createConnection(obj);