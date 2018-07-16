var mysql = require("mysql");

var connection = mysql.createConnection({
  host: "cse-curly.cse.umn.edu",
  user: "C4131S18UXXX",
  password: "XXX",
  database: "C4131S18UXXX",
  port: 3306
});

connection.connect(function(err) {
  if (err) {
    throw err;
  };
  console.log("Connected to MYSQL database!");
});

connection.query('SELECT * FROM books', function(err,rows,fields) {
	if (err) throw err;
	if (rows.length == 0)
		console.log("No entries in books table");
	else {
		for (var i = 0 ; i < rows.length; i++)
			console.log(rows[i].ID + " " + rows[i].Title + " " + rows[i].Category + " " + rows[i].ISBN);
	}
});

// Parameterized Insert
var rowToBeInserted = {
    Title: 'A Book', // Dummy Book Name
    Category: 'General', // Dummy Category Type
    ISBN : '0000001234'// Dummy 
  };

connection.query('INSERT books SET ?', rowToBeInserted, function(err, result) {  //Parameterized insert
    if(err) throw err;
    console.log("Values inserted");
  });
  

  

