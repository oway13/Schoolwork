
// Code to demonstrate a simple, memory-based session 
// which is not suitable in production code (BUT IS TOTALLY ACCEPTABLE-
// for this homework assignment.  For a production-code approach - see the examples of 
// using a session with cookies in the different resources
// we pointed you to.
//Note - you need to do the same setup steps you do for HW 6
//for this code to get it to run
//Make sure do it in a different directory

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

//first route called from browser with localhost:9007/first
//sets up the session (similar to login, but you actually have to check
//the values from the form against the values stored in the database
//before starting the session and redirecting...)
app.get('/first',function(req,res){
	console.log("Starting Session");
	req.session.value = 1;
	res.send('Started Session');
});

// second route called from browser with localhost:9007/second
// updates the session variable
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

//How would you define an implement a route to destroy() the session
//(that is the same as logout)



		
