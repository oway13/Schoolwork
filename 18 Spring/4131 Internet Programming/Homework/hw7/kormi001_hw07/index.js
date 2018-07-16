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

var xml2js = require('xml2js');

var parser = new xml2js.Parser();

var coninfo;
var connection;

fs.readFile(__dirname+"/sample_dbconfig.xml", function(err, data){
  if(err) throw err;
  parser.parseString(data, function(err, result){
    if (err) throw err;
    coninfo = result;
  });
  connection = mysql.createConnection({
      host: coninfo.dbconfig.host[0],
      user: coninfo.dbconfig.user[0],
      password: coninfo.dbconfig.password[0],
      database: coninfo.dbconfig.database[0],
      port: coninfo.dbconfig.port[0]
  });


  connection.connect(function(err) {
      if (err) {
          throw err;
      };
      console.log("Connected to MYSQL database!");
  });
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

app.get('/admin', function(req, res) {
    if (!req.session.value) {
        console.log('Unauthorized user attempting to access admin page, redirecting');
        //res.send('Not Logged in, redirecting to login');
        res.redirect('/login');
    } else {
        console.log('Directing logged in user accessing admin page');
        //res.send('Directing to favourites page');
        res.sendFile(__dirname + '/client/admin.html');
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

app.get('/getAccountsList', function(req, res) {
    console.log('Getting list of Accounts');
    connection.query('SELECT * from tbl_accounts', function(err, rows, fields) {
        if (err) throw err;
        if (rows.length == 0) {
            console.log('No entries in accounts table');
        } else {
            console.log('Successfully retrieved accounts from table');
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

// All Admin Functionality
app.post('/postUser', function(req, res) {
  var type = req.body.ftype;
  console.log("Post User Request Type: "+type);
  //New User
  if(type == "New"){
    //If all of our fields are filled in
    if(req.body.name != null && req.body.login != null && req.body.password != null){
      var userToInsert = {
          acc_name: req.body.name,
          acc_login: req.body.login,
          acc_password: sha1(req.body.password)
      };
      console.log("Received Account Name: "+userToInsert.acc_name);
      connection.query('SELECT * FROM tbl_accounts WHERE acc_login=?', userToInsert.acc_login, 
          function(err, rows, fields){
            if(err) throw err;
            //If the user does not exist, add it
            if(rows.length == 0){
              connection.query('INSERT tbl_accounts SET ?', userToInsert, function(err, result) {
                  if (err) throw err;
                  console.log("New User Inserted");
              });
              res.redirect('/admin');
            } else{
              //if the new user already exists, display error
              console.log("Duplicate User Entered, Not Added: "+userToInsert.acc_login);
              res.sendFile(__dirname + '/client/admininuser.html');
            }
      });
    } else {
      //Null fields were passed in to the new user somehow
      console.log("Null Add User Request");
      res.redirect('/admin');
    }
  //Delete User
  } else if (type == "Delete") {
    var accDelete = req.body.id;
    //If the account we are editing is logged in
    if(req.session.value == accDelete){
      console.log("Attempting to Delete Logged In Account");
      res.sendFile(__dirname + '/client/adminlogged.html');
      //We are not editing the logged in account
    } else {
      console.log("Deleting Account: "+accDelete);
      connection.query('DELETE FROM tbl_accounts WHERE acc_id=?', accDelete, function(err, result) {
          if(err) throw err;
          console.log("Account Deleted");
          res.redirect('/admin');
      });
    }
  //Edit User
  } else if (type == "Edit") {
    var accEditID = req.body.id;
    var accEditName = req.body.name;
    var accEditLogin = req.body.login;
    //If we are editing account that is logged in
    if(req.session.value == accEditID){
      console.log("Attempting to Edit Logged In Account");
      res.sendFile(__dirname + '/client/adminlogged.html');
    //If the account we are editing is not logged in
    } else {
      connection.query('SELECT * FROM tbl_accounts WHERE acc_login=?', accEditLogin, 
          function(err, rows, fields){
            if(err) throw err;
            //If the account doesn't exist, or if it does, it is the same as the one we are editing
            if(rows.length == 0 || accEditLogin == rows[0].acc_login){
              console.log("Editing Account: "+accEditName+" "+ accEditID+" "+accEditLogin );
              console.log("PS"+req.body.password+".");
              //If we are editing the password too
              if(req.body.password != "") {
                var accEditPassword = sha1(req.body.password);
                connection.query('UPDATE tbl_accounts SET acc_name=?, acc_login=?, acc_password=? WHERE acc_id=?;', [accEditName, accEditLogin, accEditPassword, accEditID], 
                  function(err, result){
                    if (err) throw err;
                    console.log("Account w/ Password Edited");
                    res.redirect('/admin');
                });
                //If we are not editing password
              } else {
                connection.query('UPDATE tbl_accounts SET acc_name=?, acc_login=? WHERE acc_id=?;', [accEditName, accEditLogin, accEditID], 
                  function(err, result){
                    if (err) throw err;
                    console.log("Account Edited");
                    res.redirect('/admin');
                });
              }
              //If we are changing the login to one that already exists
            } else{
              console.log("Duplicate User Entered, Not Edited: "+accEditName);
              res.sendFile(__dirname + '/client/admininuser.html');
              //res.redirect('/admin');
            }
      });
    }
  }
});

// POST method to validate user login
// upon successful login, user session is created
app.post('/validateLoginDetails', function(req, res) {
    var user = req.body.username;
    var pass = sha1(req.body.password);
    console.log('Received login request');
    connection.query('SELECT acc_id FROM tbl_accounts WHERE acc_login=? AND acc_password=?', [user, pass],
        function(err, rows, fields) {
            if (err) throw err;
            if (rows.length == 0) {
                //TODO: Invalid Login
                console.log('Invalid Login Attempt');
                //res.redirect('/login');
                res.sendFile(__dirname + '/client/loginfail.html');
            } else {
                console.log("Starting Session");
                console.log(JSON.stringify(rows));
                req.session.value = rows[0].acc_id;
                //res.send('Started Session');
                res.redirect('/favourites');
            }
        });
});

app.get('/getUserName', function(req, res) {
  connection.query('SELECT acc_login, acc_name FROM tbl_accounts WHERE acc_id=?', req.session.value,
      function(err, rows, fields) {
          if (err) throw err;
          if (rows.length == 0) {
              console.log("Something Broke");
          } else {
              res.send(JSON.stringify(rows));
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