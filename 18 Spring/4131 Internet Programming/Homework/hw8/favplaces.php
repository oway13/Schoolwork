<?php
  session_start();
  if(isset($_SESSION['id']) && isset($_SESSION['name'])){
    if(!isset($_POST['submitB'])){
      echo '<html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <link rel="stylesheet" type="text/css" href="style.css">
            <title>Favourite Places</title>
        </head>

        <body>
          <nav class="navbar navbar-default">
              <div class="container-fluid">
                  <ul class="nav navbar-nav" id="navbar">
                  <div id="form">
                      <form name="logout" method="post" action="">
                        <input type="submit" name="submitB" value="Logout"> 
                      </form>
                  </ul>
              </div>
          </nav>
            <div class="container">
            <table class="table" id="myFavTable">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">Address 2</th>
                            <th scope="col">Open</th>
                            <th scope="col">Close</th>
                            <th scope="col">Information</th>
                            <th scope="col">URL</th>
                        </tr>
                    </thead>
                    <tbody>';
        //Get Filter Data and build Query
        $query = "SELECT * FROM tbl_places";
        if(isset($_POST['submitF'])){
          echo $_POST['filterid']."<br>";
          echo isset($_POST['filterid'])."<br>";
          echo $_POST['filtername']."<br>";
          echo isset($_POST['filtername'])."<br>";
          echo gettype($_POST['filtername'])."<br>";
          echo ($_POST['filtername']=="")."<br>";
          if($_POST['filterid'] == ""){
            if($_POST['filtername'] != ""){ // FT
              $query = $query." WHERE place_name='".$_POST['filtername']."'";
            } 
          } else { //T*
            $query = $query." WHERE place_id='".$_POST['filterid']."'";
          }
        }
        $query = $query.";";
        echo $query."<br>";
        unset($_POST['submitF']);
        
        //DB Stuff
        include_once 'database.php';
        $conn=new mysqli($db_servername,$db_username,$db_password,$db_name,$db_port);
        if ( $conn->connect_error ) {
            echo "<h1> DB Connection Error </h1>";
        } else {
          $result = $conn->query($query);
          if($result->num_rows != 0){
            while($row = mysqli_fetch_row($result)){
              echo "<tr>";
              foreach($row as $value){
                echo "<td>".$value."</td>";
              }
              echo "</tr>";
            }
          }
        }
        
            echo '</tbody>
                </table>
            </div>
            <div id="form">
                <h1> Filter Criteria </h1>
                <form name="filter" method="post" action="">
                    <p>Place Id:</p>
                    <p><input type="text" name="filterid"></p>
                    <p>Place Name:</p>
                    <p><input type="text" name="filtername"></p>
                    <p><input type="submit" name="submitF" value="Submit"></p>
                </form>
            </div>
        </body>

        </html>';
    } else {
      unset($_SESSION['id']);
      unset($_SESSION['name']);
      header('Location: http://www-users.cselabs.umn.edu/~kormi001/login.php');
      die();
    }
  } else {
    header('Location: http://www-users.cselabs.umn.edu/~kormi001/login.php');
    die();
  }






?>