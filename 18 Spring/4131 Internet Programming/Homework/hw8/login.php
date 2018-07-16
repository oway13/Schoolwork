<?php 
  session_start();
  if(isset($_SESSION['id']) && isset($_SESSION['name'])){
    header('Location: http://www-users.cselabs.umn.edu/~kormi001/favplaces.php');
    die();
  } else {
    if(isset($_POST['submitB'])){
      //DB Stuff
      include_once 'database.php';
      //echo $db_servername." ".$db_username." ".$db_password." ".$db_name." ".$db_port."<br>";
      $conn=new mysqli($db_servername,$db_username,$db_password,$db_name,$db_port);
      if ( $conn->connect_error ) {
          echo '<html lang="en"><body>DB Connection Error<h1>'. $db_servername." ".$db_username." ".$db_password." ".$db_name." ".$db_port.'</h1></body></html>';
      } else {
          $username = $_POST['username'];
          $password = sha1($_POST['password']);
          //SELECT acc_id FROM tbl_accounts WHERE acc_login=? AND acc_password=?
          $query = "SELECT * FROM tbl_accounts WHERE acc_login='".$username."' AND acc_password='".$password."';";
          $result = $conn->query($query);
          if($result->num_rows == 0){
              //Incorrect Login
              echo '<html lang="en">
              
              <head>
                  <meta charset="utf-8">
                  <link rel="stylesheet" type="text/css" href="style.css">
                  <title>Login Page</title>
              </head>
              
              <body>
                  <div class="headers">
                      <h1>Welcome, log in below</h1>
                      <p id="response">
                            Invalid Credentials. Please Try Again!
                      </p>
                  </div>
                  <div id="form">
                      <form name="login" method="post" action="">
                          <input type="text" name="username" required>
                          <input type="password" name="password" required>
                          <input type="submit" name="submitB" value="Submit">
                      </form>
                  </div>
              </body>
              
              </html>';
              // echo '<html lang="en">
              // 
              // <head>
              //     <meta charset="utf-8">
              //     <link rel="stylesheet" type="text/css" href="style.css">
              //     <title>Login Page</title>
              // </head>
              // 
              // <body>
              //     '.'<h1>'. $db_servername." ".$db_username." ".$db_password." ".$db_name." ".$db_port.'</h1>'."<br>".$query."<br>".'
              //     
              // </body>
              // 
              // </html>';
          } else {
              $account = $result->fetch_assoc();
              //echo $account['acc_id'];
              
              $_SESSION['id'] = $account['acc_id'];
              $_SESSION['name'] = $account['acc_name'];
              header('Location: http://www-users.cselabs.umn.edu/~kormi001/favplaces.php');
              die();
          }
      }
    } else{
      echo '<html lang="en">

      <head>
          <meta charset="utf-8">
          <link rel="stylesheet" type="text/css" href="style.css">
          <title>Login Page</title>
      </head>

      <body>
          <div class="headers">
              <h1>Welcome, log in below</h1>
              <p id="response">
              </p>
          </div>
          <div id="form">
              <form name="login" method="post" action="">
                  <input type="text" name="username" required>
                  <input type="password" name="password" required>
                  <input type="submit" name="submitB" value="Submit">
              </form>
          </div>
      </body>

      </html>';
    }
  }
  
?>

