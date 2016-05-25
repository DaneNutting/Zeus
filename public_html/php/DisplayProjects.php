<?php
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
  
  $SprintsQuery = "SELECT a.project_id AS 'id', a.project_name AS 'name', a.project_description as 'description', concat_ws(' ', c.user_forename, c.user_surname) as 'projLead', concat('../images/projects/',a.project_id,'.png') 'photoAddress'
                        FROM project a
                        inner join users2 c on c.user_id = a.project_lead_id 
                        inner join users_projects b where b.project_id = a.project_id and b.user_id = '".$_SESSION['SESS_MEMBER_ID']."'";

  $SprintResult = $conn->query($SprintsQuery) or exit("Error code ({$conn->errno}): {$conn->error}");

	while ($row = mysqli_fetch_array($SprintResult, MYSQL_ASSOC)) {
	   $ProjectsArray[] = array(
        'projectID' => $row['id'],
        'projectName' => $row['name'],
        'description' => $row['description'],
        'projectLead' => $row['projLead'],
        'imageAddress' => $row['photoAddress']
        );
	}
  
	echo json_encode($ProjectsArray);

  $conn->close();
?>

