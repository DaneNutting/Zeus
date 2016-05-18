<?php
  
  //PHP file to update Sprint values
  
  // Connecting to the MySQL server
  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $sprintId = $_POST["postedID"]
  $sprintName = mysqli_escape_string($conn,$_POST["postedName"]);
  $startDate = $_POST["postedStartDate"];
  $endDate = $_POST["postedEndDate"];
  $projectID = $_SESSION["SESS_PROJECT_ID"];
  // $release = 1;
  // $startingEff = 297;
  
  //Check for a Null sprint ID coming from the front end and throw and error 
  if($sprintId == null || $sprintId == ""){ 
    exit("Error: Sprint ID is null or empty");
  }
  else{
  //Query to update a Sprint based on the ID of that Sprint
    $query = 
      "UPDATE iteration
      SET iteration_name = '$sprintName',
      iteration_start_date = '$startDate',
      iteration_end_date = $endDate,
      project_id = $projectId,
      WHERE iteration_id = '$sprintId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Sprint Updated successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

