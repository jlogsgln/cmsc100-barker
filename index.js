var express 	= require("express");
var app 		= express();
var bodyParser 	= require('body-parser');
var session 	= require('express-session');
var redis 		= require('redis');
var redisStore = require('connect-redis')(session);
var client 		= redis.createClient();


app.use(session({
    secret: 'Twitter',
    resave: false,
    saveUninitialized: true,
    store: new redisStore({
        host: 'localhost',
        port: 6379,
        client: client
    }),
    cookie: {
        
        httpOnly: false,
        secure: false, // set "true" if https
        maxAge: 3600000 * 5 //5 hours?
    }
}))

app.use('/', express.static(__dirname + '/frontend'));
app.use(require('method-override')());
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.use(require(__dirname + '/backend/config/router')(express.Router()));

var server = app.listen(9000, function() {
	var host = server.address().address;
	var port = server.address().port;

	console.log("http://%s:%s", host, port);
});
