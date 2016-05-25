<?php
  
  //PHP file to update Project values
  
  // Connecting to the MySQL server
  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $projectId = $_POST["postedID"];
  $projectName = mysqli_escape_string($conn,$_POST["postedName"]);
  $projectDesc = mysqli_escape_string($conn,$_POST["postedDesc"]);
  $projectEnd = $_POST["postedEnd"];
  $projectStart = $_POST["postedStart"];
    $projectLead = $_POST["postedLead"];
  //$pbiProject = $_POST["postedProject"];
  
  //Check for a Null pbiID coming from the front end and throw and error 
  if($projectId == null || $projectiId == ""){ 
    exit("Error: Project ID is null or empty");
  }
  else{
  //Query to update a Project based on the ID of that Project
    $query = 
      "UPDATE project
      SET project_name = '$projectName',
      project_description = '$projectDesc',
      project_deadline = $projectEnd,
      project_start_date = $projectStart,
      project_lead_id = (select user_id from users2 where concat_ws(' ', user_forename, user_surname) = '$projectLead')
      WHERE project_id = '$projectId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Project Updated successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

