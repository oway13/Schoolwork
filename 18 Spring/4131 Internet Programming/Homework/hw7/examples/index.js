// include the express module which is a Node.js web application framework
var express = require("express");

// create an express application
var app = express();

// helps in extracting the body portion of an incoming request stream
var bodyparser = require('body-parser');

// fs module - provides an API for interacting with the file system
var fs = require("fs");

// required for reading XML files
var xml2js = require('xml2js');


var parser = new xml2js.Parser();
var theinfo;

fs.readFile(__dirname + '/test.xml', function(err, data) {
	if (err) throw err;
	console.log("data: \n" + data);
    parser.parseString(data, function (err, result) {
		if (err) throw err;
		console.log("The first name stored in the info record:\n" + result.info.fname[0]);
        theinfo = result;
       
	});
	console.log("the info:\n"+ theinfo +"\n");
	printstuff();
});


function printstuff(){
	console.log("first name: " + theinfo.info.fname[0]); 
	console.log("last name: " + theinfo.info.lname[0]); 
	console.log("Social Security Number: " + theinfo.info.ssn[0]); 
	console.log("Location: " + theinfo.info.location[0]); 
	console.log("Age: " + theinfo.info.age[0]); 
}
