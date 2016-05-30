<?php
  
  //PHP file to change task state

  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $stateId = $_POST["postedStateID"];
  $taskName = $_POST["postedTaskName"];
  $taskId = substr($taskName,4);
  
  //Check for a Null pbiID coming from the front end and throw and error 
    $query = "UPDATE task SET state_id = '$stateId' WHERE task_id = '$taskId' ";

    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "PBI Updated successfully";
    } else {
         echo "Error: " . $query . "<br>" . $conn->error;
    }    
  
  echo $stateId, $taskName, $taskId;
  
  $conn->close();
?>

