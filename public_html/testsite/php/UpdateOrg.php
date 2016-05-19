<?php
  
  //PHP file to update Organisation values
  
  // Connecting to the MySQL server
  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $orgId = $_POST["postedID"];
  $orgName = mysqli_escape_string($conn,$_POST["postedName"]);
  
  //Check for a Null Organisation ID coming from the front end and throw and error 
  if($orgId == null || $orgId == ""){ 
    exit("Error: Organisation ID is null or empty");
  }
  else{
  //Query to update an Organisation based on the ID of that Organisation
    $query = 
      "UPDATE organisation
      SET org_name = '$orgName'
      WHERE org_id = '$orgId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Organisation Updated successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

