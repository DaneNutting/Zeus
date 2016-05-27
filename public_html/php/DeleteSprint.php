<?php
  
  //PHP file to delete a Task
  
  // Connecting to the MySQL server

  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $sprintId = $_POST["postedID"];
  
  //Check for a Null pbiID coming from the front end and throw and error 
  if($sprintId == null || $sprintId == ""){ 
    exit("Error: sprint ID is null or empty");
  }
  else{
  //Query to update a PBI based on the ID of that PBI
    $query = 
      "DELETE FROM iteration where iteration_id = '$sprintId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "PBI Updated successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

