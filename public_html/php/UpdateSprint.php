<?php
  
  //PHP file to update PBI values
  
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
  $sprintId = $_POST["postedID"];
  $sprintName = mysqli_escape_string($conn,$_POST["postedName"]);
  $sprintStart = $_POST["postedStartDate"];
  $sprintEnd= $_POST["postedEndDate"];
  $projectId = $_SESSION["SESS_PROJECT_ID"];
  
  //Check for a Null pbiID coming from the front end and throw and error 
  if($sprintId == null || $sprintId == ""){ 
    exit("Error: Sprint ID is null or empty");
  }
  else{
  //Query to update a PBI based on the ID of that PBI
    $query = 
      "update iteration
      SET iteration_name = '$sprintName',
      iteration_start_date = '$sprintStart',
      iteration_end_date = '$sprintEnd'
      where iteration_id = '$sprintId'
      and project_id = $projectId";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
         echo "Sprint Updated successfully";
    } else {
         echo "Error: ". $conn->error;
    }
  }
  $conn->close();
?>

