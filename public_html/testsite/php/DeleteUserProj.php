<?php
  
  //PHP file to delete a User Project

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
  //Query to delete a user from a project
    $query = 
      "DELETE FROM users_ptojects 
      WHERE user_id =  (select user_id from users2 where concat_ws(' ', user_forename, user_surname) = '$user')
      AND project_id = (select project_id from project where project_name = '$project)
      AND role_id = (select user_role_id from user_roles where user_role_description = '$role')";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "User removed from project successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

