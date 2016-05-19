<?php
  
  //PHP file to create a User Role
  
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
  $user = $_POST["postedUser"];
  $project = $_POST["postedProject"];
  $role = $_POST["postedRole"];
  
  //Check for a Null user coming from the front end and throw and error 
  if($user == null || $user == ""){ 
    exit("Error: User is null or empty");
  }
  else{
  //Query to insert a User Role
    $query = 
      "INSERT INTO users_projects
      (user_id, project_id, role_id)
      VALUES
      ( 
      (select user_id from users where concat_ws(' ', user_forename, user_surname) = '$user'),
      (select project_id from project where project_name = '$project),
      (select user_role_id from user_roles where user_role_description = '$role'))";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "User Role created successfully";
    } else {
         echo "Error: " . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

