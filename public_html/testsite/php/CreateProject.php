<?php
  
  //PHP file to create a Project
  
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
  $projectId = $_POST["postedID"];
  $projectName = mysqli_escape_string($conn,$_POST["postedName"]);
  $projectDesc = mysqli_escape_string($conn,$_POST["postedDesc"]);
  $projectEnd = $_POST["postedEnd"];
  $projectStart = $_POST["postedStart"];
  
  //Check for a Null project name coming from the front end and throw and error 
  if($projectName == null || $projectName == ""){ 
    exit("Error: Project Name is null or empty");
  }
  else{
  //Query to insert a project based on the ID of that project
    $query = 
      "INSERT INT0 project
      (project_name, project_description, project_deadline, project_start_date)
      VALUES
      ('$projectName', 
      '$projectDesc', 
      '$projectEnd', 
      '$projectStart)";
    
    //Run the query and provide feedback on how the parsing went
    if ($conn->query($query) === TRUE) {
    //     echo "Project created successfully";
    } else {
         echo "Error: " . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

