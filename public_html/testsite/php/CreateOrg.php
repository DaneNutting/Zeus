<?php
  
  //PHP file to create an Organisation
  
  // Connecting to the MySQL server

  include('DatabaseCon.php');
  
  //Start session
  session_start();
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $orgId = $_POST["postedID"];
  $orgName = mysqli_escape_string($conn,$_POST["postedName"]);
  
  //Check for a Null pbiID coming from the front end and throw and error 
  if($orgName == null || $orgName == ""){ 
    exit("Error: Organisation Name is null or empty");
  }
  else{
  //Query to create an organisation
    $query = 
      "INSERT INTO organisation
      (org_name)
      VALUES
      ('$orgName')";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Organisation created successfully";
    } else {
         echo "Error: " . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

