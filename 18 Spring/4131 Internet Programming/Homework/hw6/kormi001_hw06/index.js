// include the express module
var express = require("express");

// create an express application
var app = express();

// helps in extracting the body portion of an incoming request stream
var bodyparser = require('body-parser');

// fs module - provides an API for interacting with the file system
var fs = require("fs");

// helps in managing user sessions
var session = require('express-session');

// native js function for hashing messages with the SHA-1 algorithm
var sha1 = require('sha1');

// include the mysql module
var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "cse-curly.cse.umn.edu",
    user: "C4131S18U55",
    password: "60",
    database: "C4131S18U55",
    port: 3306
});

connection.connect(function(err) {
    if (err) {
        throw err;
    };
    console.log("Connected to MYSQL database!");
});

// apply the body-parser middleware to all incoming requests
app.use(bodyparser());

// use express-session
// in memory session is sufficient for this assignment
app.use(session({
    secret: "csci4131secretkey",
    saveUninitialized: true,
    resave: false
}));

// server listens on port 9007 for incoming connections
app.listen(9007, () => console.log('Listening on port 9007!'));

// // GET method route for the favourites page.
// It serves favourites.html present in client folder
app.get('/favourites', function(req, res) {
    if (!req.session.value) {
        console.log('Unauthorized user attempting to access favourites page, redirecting');
        //res.send('Not Logged in, redirecting to login');
        res.redirect('/login');
    } else {
        console.log('Directing logged in user accessing favourites page');
        //res.send('Directing to favourites page');
        res.sendFile(__dirname + '/client/favourites.html');
    }
});

// GET method route for the addPlace page.
// It serves addPlace.html present in client folder
app.get('/addPlace', function(req, res) {
    if (!req.session.value) {
        console.log('Unauthorized user attempting to access form page, redirecting');
        //res.send('Not Logged in, redirecting to login page');
        res.redirect('/login');
    } else {
        console.log('Directing logged in user accessing form page');
        //res.send('Directing to form page');
        res.sendFile(__dirname + '/client/addPlace.html');
    }
});

app.get('/', function(req, res) {
    if (!req.session.value) {
        res.redirect('/login');
    } else {
        res.redirect('/favourites');
    }
});

// GET method route for the login page.
// It serves login.html present in client folder
app.get('/login', function(req, res) {
    if (!req.session.value) {
        console.log('Directing to login page');
        //res.send('Directing to login page');
        res.sendFile(__dirname + '/client/login.html');
    } else {
        console.log('Logged in user attempting to access login page, redirecting');
        //res.send('User is already logged in, redirecting to favourites page');
        res.redirect('/favourites');
    }
});

// GET method to return the list of favourite places
// The function queries the table tbl_places for the list of places and sends the response back to client
app.get('/getListOfFavPlaces', function(req, res) {
    //TODO: SQL to get list of favorite places
    console.log('Getting list of favorite places');
    connection.query('SELECT * from tbl_places', function(err, rows, fields) {
        if (err) throw err;
        if (rows.length == 0) {
            console.log('No entries in places table');
        } else {
            console.log('Successfully retrieved places from table');
            res.send(JSON.stringify(rows));
        }
    });
});

// POST method to insert details of a new place to tbl_places table
app.post('/postPlace', function(req, res) {
    var placeToInsert = {
        place_name: req.body.placename,
        addr_line1: req.body.addressline1,
        addr_line2: req.body.addressline2,
        open_time: req.body.opentime,
        close_time: req.body.closetime,
        add_info: req.body.additionalinfo,
        add_info_url: req.body.additionalinfourl
    };

    console.log("Received postPlace request");
    connection.query('INSERT tbl_places SET ?', placeToInsert, function(err, result) {
        if (err) throw err;
        console.log("New Place Inserted");
    });
    res.redirect('/favourites');
});

// POST method to validate user login
// upon successful login, user session is created
app.post('/validateLoginDetails', function(req, res) {
    var user = req.body.username;
    var pass = sha1(req.body.password);
    console.log('Received login request');
    connection.query('SELECT acc_name FROM tbl_accounts WHERE acc_login=? AND acc_password=?', [user, pass],
        function(err, rows, fields) {
            if (err) throw err;
            if (rows.length == 0) {
                //TODO: Invalid Login
                console.log('Invalid Login Attempt');
                res.redirect('/login');
            } else {
                console.log("Starting Session");
                req.session.value = true;
                //res.send('Started Session');
                res.redirect('/favourites');
            }
        });
});

// log out of the application
// destroy user session
app.get('/logout', function(req, res) {
    if (!req.session.value) {
        console.log('Unauthorized user attempting to log out');
        //res.send('No session data, failed to log out');
        res.redirect('/login');
    } else {
        console.log('Logging out, destroying session');
        req.session.value = false;
        req.session.destroy();
        //res.send('Successfully logged out, redirecting to login page');
        res.redirect('/login');
    }
});

app.get('/404', function(req, res) {

});

// middle ware to server static files
app.use('/client', express.static(__dirname + '/client'));


// function to return the 404 message and error to client
app.get('*', function(req, res) {
    //TODO: find out what to do for 404 and do it.
    res.status(404);
    //console.log('Request Page Not Found');
    res.sendFile(__dirname + '/client/404.html')
});