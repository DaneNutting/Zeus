<?php
  // Connecting to the MySQL server  
  include('DatabaseCon.php');
  
  // Start session
  session_start();
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 
  
  $SprintID = $_POST["postedSprintID"];
  //$SprintID = 50;

  $SprintsQuery = "SELECT CONCAT_WS(' - ',e.project_name, b.iteration_name) 'itName', b.iteration_start_date 'itStart', b.iteration_end_date 'itEnd', b.iteration_ID 'itID'
            FROM  iteration b
            inner join releases a on a.release_id = b.release_id
            inner join project e on e.project_id = a.project_id 
            where b.project_id = '".$_SESSION['SESS_PROJECT_ID']."'
            and b.iteration_ID = '$SprintID'";

  $SprintResult = $conn->query($SprintsQuery) or exit("Error code ({$conn->errno}): {$conn->error}");

	while ($row = mysqli_fetch_array($SprintResult, MYSQL_ASSOC)) {
		$SprintsArray[] = array(
      'itName' => $row['itName'],
      'itStart' => $row['itStart'],
      'itEnd' => $row['itEnd'],
      'itStartReadable' => date('Y-m-d',strtotime($row['itStart'])),
      'itEndReadable' => date('Y-m-d',strtotime($row['itEnd'])),
      'itID' => $row['itID']
		  );
	}
  
	echo json_encode($SprintsArray);

  $conn->close();
?>

