<?php
  
  //PHP file to delete a Sprint

  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $iterationId = $_POST["postedID"];
  
  //Check for a Null Iteration ID coming from the front end and throw and error 
  if($iterationId == null || $iterationId == ""){ 
    exit("Error: Iteration ID is null or empty");
  }
  else{
  //Query to delete a iteration based on the ID of that iteration
    $query = 
      "DELETE FROM iteration where iteration_id = '$iterationId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Iteration deleted successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

