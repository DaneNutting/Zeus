<?php
  
  //PHP file to update User values
  
  // Connecting to the MySQL server
  include('DatabaseCon.php');
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  $userId = $_POST["postedID"];
  $userFName = mysqli_escape_string($conn,$_POST["postedFName"]);
  $userSName = mysqli_escape_string($conn,$_POST["postedSName"]);
  $userEmail = mysqli_escape_string($conn,$_POST["postedEmail"]);
  $userOrg = mysqli_escape_string($conn,$_POST["postedOrg"]);
  
  //Check for a Null User ID coming from the front end and throw and error 
  if($userId == null || $userId == ""){ 
    exit("Error: User ID is null or empty");
  }
  else{
  //Query to update a User based on the ID of that User
    $query = 
      "UPDATE users2
      SET user_forename = '$userFName',
      user_surname = '$userSName',
      user_email = $userEmail,
      userOrg = (SELECT org_id FROM organisation WHERE org_name = '$userOrg')
      WHERE user_id = '$userId'";
    
    //Run the query and provide feedback on how the update went
    if ($conn->query($query) === TRUE) {
    //     echo "User Updated successfully";
    } else {
    //     echo "Error: " . $query . "<br>" . $conn->error;
    }
  }
  $conn->close();
?>

