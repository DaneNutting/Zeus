<?php
  
  //PHP file to delete a User

  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $userId = $_POST["postedID"];
  
  //Check for a Null User ID coming from the front end and throw and error 
  if($userId == null || $userId == ""){ 
    exit("Error: User ID is null or empty");
  }
  else{
  //Query to delete a user based on the ID of that user
    $query = 
      "DELETE FROM users2 where user_id = '$userId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "User Deleted successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

