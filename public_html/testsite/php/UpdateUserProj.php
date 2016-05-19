<?php
  
  //PHP file to update Users Projects values
  
  // Connecting to the MySQL server
  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $user = $_POST["postedUser"];
  $project = $_POST["postedProject"];
  $role = $_POST["postedRole"];
  
  //Check for a Null user coming from the front end and throw and error 
  if($user == null || $user == ""){ 
    exit("Error: User is null or empty");
  }
  else{
  //Query to update a user projects based on the ID of that user
    $query = 
      "UPDATE users_projects
      SET 
      project_id = (select project_id from project where project_name = '$project),
      role_id = (select user_role_id from user_roles where user_role_description = '$role')
      WHERE 
      user_id = (select user_id from users where concat_ws(' ', user_forename, user_surname) = '$user')";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "User Projects successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

