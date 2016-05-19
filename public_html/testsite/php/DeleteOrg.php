<?php
  
  //PHP file to delete an Organisation

  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $orgId = $_POST["postedID"];
  
  //Check for a Null Organisation ID coming from the front end and throw and error 
  if($orgId == null || $orgId == ""){ 
    exit("Error: Organisation ID is null or empty");
  }
  else{
  //Query to delete an organisation based on the ID
    $query = 
      "DELETE FROM organisation where org_id = '$orgId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "Organisation deleted successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

