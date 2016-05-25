<?php
  // // Connecting to the MySQL server
  
  include('DatabaseCon.php');
    
  //Start session
  session_start();
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 
  
  $query =    
    "select
    @var:= IFNULL(
        (select SUM( PBI_effort ) 
            from backlog_items a 
            right outer join iteration b on b.iteration_ID = a.iteration_ID 
            where a.project_id = '".$_SESSION['SESS_PROJECT_ID']."'  
          AND b.iteration_start_date <= DATE_FORMAT(sysdate(), '%Y-%m-%d') 
            and b.iteration_end_date >= DATE_FORMAT(sysdate(), '%Y-%m-%d')
          and state_id = 4) / 
        (select 
          SUM( PBI_effort ) 
          from backlog_items a 
          right outer join iteration b on b.iteration_ID = a.iteration_ID 
          where a.project_id = '".$_SESSION['SESS_PROJECT_ID']."' 
          and b.iteration_start_date <= DATE_FORMAT(sysdate(), '%Y-%m-%d') 
            and b.iteration_end_date >= DATE_FORMAT(sysdate(), '%Y-%m-%d')
        ) * 100,0) as 'PercentageOfItEffortDone',
    100 - @var as 'PercentageOfItEffortRemaining'";

    /* Pie chart 2 Dynamic query - Time done*/
    $pie2Query =
    "SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
    100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
    FROM (SELECT b.iteration_id, IFNULL(SUM(a.task_hours_done),1) denominator 
            FROM task a
            INNER JOIN iteration b
            ON b.iteration_id = a.iteration_id
            WHERE b.iteration_start_date <= CURDATE()
            AND b.iteration_end_date >= CURDATE()
            AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') d
    LEFT OUTER JOIN 
          (SELECT b.iteration_id, SUM(a.task_hours_done) numerator
            FROM task a
            INNER JOIN iteration b
            ON b.iteration_id = a.iteration_id
            WHERE b.iteration_start_date <= CURDATE()
            AND b.iteration_end_date >= CURDATE()
            AND a.state_id = 10
            AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') n
    ON d.iteration_id = n.iteration_id";

    /* Pie chart 3 Dynamic query time done for logged in user*/
    $pie3Query =
    "SELECT (IFNULL(n.numerator,0)/d.denominator) * 100 percent_done, 
    100 - ((IFNULL(n.numerator,0)/d.denominator) * 100) percent_remaining
    FROM (SELECT b.iteration_id, IFNULL(SUM(a.task_hours_done),1) denominator 
            FROM task a
            INNER JOIN iteration b
            ON b.iteration_id = a.iteration_id
            WHERE b.iteration_start_date <= CURDATE()
            AND b.iteration_end_date >= CURDATE()
            AND a.assignee = '".$_SESSION['SESS_USER_ID']."'
            AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') d
    LEFT OUTER JOIN 
          (SELECT b.iteration_id, SUM(a.task_hours_done) numerator
            FROM task a
            INNER JOIN iteration b
            ON b.iteration_id = a.iteration_id
            WHERE b.iteration_start_date <= CURDATE()
            AND b.iteration_end_date >= CURDATE()
            AND a.state_id = 10
            AND a.assignee = '".$_SESSION['SESS_USER_ID']."'
            AND a.project_id = '".$_SESSION['SESS_PROJECT_ID']."') n
    ON d.iteration_id = n.iteration_id";
  
  $result = $conn->query($query) or exit("Error code ({$conn->errno}): {$conn->error}");

	while ($row = mysqli_fetch_array($result, MYSQL_ASSOC)) {
		$piearray[] = array(

			'effDone' => $row['PercentageOfItEffortDone'],
			'effRem' => $row['PercentageOfItEffortRemaining']
		  );
	}
  
  $result2 = $conn->query($pie2Query) or exit("Error code ({$conn->errno}): {$conn->error}");

	while ($row = mysqli_fetch_array($result2, MYSQL_ASSOC)) {
		$piearray2[] = array(

			'projectHoursDone' => $row['percent_done'],
			'projectHoursRem' => $row['percent_remaining']
		  );
	}
  
  $result3 = $conn->query($pie3Query) or exit("Error code ({$conn->errno}): {$conn->error}");

	while ($row = mysqli_fetch_array($result3, MYSQL_ASSOC)) {
		$piearray3[] = array(

			'userHoursDone' => $row['percent_done'],
			'userHoursRem' => $row['percent_remaining']
		  );
	}
  
	//echo json_encode($piearray);
  
  $AllResults[] = array($piearray, $piearray2, $piearray3);

	echo json_encode($AllResults);


  $conn->close();
?>

