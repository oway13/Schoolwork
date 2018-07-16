// include the express module which is a Node.js web application framework
var express = require("express");

// create an express application
var app = express();

// helps in extracting the body portion of an incoming request stream
var bodyparser = require('body-parser');

// fs module - provides an API for interacting with the file system
var fs = require("fs");

// helps in managing user sessions
var session = require('express-session');

var app = express();


app.use(session({
  secret: "csci4131secretkey",
  saveUninitialized: true,
  resave: false}
));

// server listens on port 9007 for incoming connections
app.listen(9007, () => console.log('Listening on port 9007!'));

app.get('/first',function(req,res){
	console.log("Starting Session");
	req.session.value = 1;
	res.send('Started Session');
});

app.get('/second',function(req,res){
	console.log("Attempting to visit second");
	if (!req.session.value)
		res.send('Session Not Started');
    else {
		console.log("Got to else in second");
		req.session.value += 1;
		var newval = req.session.value;
		res.send('Session value: ' + newval);
	}
});

// log out of the application  THIS IS AN EXERCISE!!!
// destroy user session
app.get('/logout', function(req, res) {
	if(!req.session.value) {
		res.send('Session not started, can not logout!');
	} else {
		console.log ("Successfully Destroyed Session!");
		req.session.destroy();
		res.send("Session Complete!");
		//res.redirect('/login');
	}
});

		
