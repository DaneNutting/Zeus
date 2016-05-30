<?php
  include('DatabaseCon.php');
  
  //Start session
  session_start();
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 
  
  $query = "
  SELECT 
  a.iteration_id,
  a.iteration_name as 'iteration_name',
  a.starting_effort as 'starting_effort',
  IFNULL(SUM(pbi_effort),0) 'effort',
  IFNULL(
    (SELECT SUM(pbi_effort)
    FROM backlog_items
    WHERE iteration_id <= a.iteration_id
    AND project_id = '".$_SESSION['SESS_PROJECT_ID']."'
    AND state_id = 4),0) 'effort_done_to_date',
  a.starting_effort - IFNULL(
    (SELECT SUM(pbi_effort)
      FROM backlog_items
      WHERE iteration_id <= a.iteration_id
      AND project_id = '".$_SESSION['SESS_PROJECT_ID']."'
      AND state_id = 4)
  ,0) 'remaining_effort'
  FROM iteration a
  LEFT OUTER JOIN (
    SELECT * FROM backlog_items
    WHERE project_id = '".$_SESSION['SESS_PROJECT_ID']."'
    AND state_id = 4
  ) b ON b.iteration_id = a.iteration_id
  WHERE a.iteration_start_date <= CURDATE()
  AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."'
  GROUP BY a.iteration_id
  ORDER BY a.iteration_id";
  
  $result = $conn->query($query) or exit("Error code ({$conn->errno}): {$conn->error}");

	while ($row = mysqli_fetch_array($result, MYSQL_ASSOC)) {
		$grapharray[] = array(

			'itName' => $row['iteration_name'],
			'effCom' => $row['effort'],
      'effTot' => $row['starting_effort'],
      'effDone'=> $row['effort_done_to_date'],
      'effRem' => $row['remaining_effort'],
		  );
	}
  
	echo json_encode($grapharray);

  $conn->close();
?>

