<?php
  
  //PHP file to delete a Project

  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $projectId = $_POST["postedID"];
  
  //Check for a Null pbiID coming from the front end and throw and error 
  if($projectId == null || $projectId == ""){ 
    exit("Error: Project ID is null or empty");
  }
  else{
  //Query to delete a project based on the ID of that project
    $query = 
      "DELETE FROM project where project_id = '$projectId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Project deleted successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

