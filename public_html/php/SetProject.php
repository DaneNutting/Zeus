<?php
  // Connecting to the MySQL server

  include('DatabaseCon.php');
   
  //Start session
  session_start();
  
  $ProjectID = $_POST["postedProjectID"];

  $_SESSION["SESS_PROJECT_ID"] = $ProjectID;
  
  echo $_SESSION["SESS_PROJECT_ID"];  
?>
      