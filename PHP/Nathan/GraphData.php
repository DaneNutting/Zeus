<?php
  // Connecting to the MySQL server
  $host="10.168.1.92";
  $user_name="wearezeu_phpserv";
  $pwd="0!ZeusPhP!0";
  $dbName="wearezeu_test01";
    
  // Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 

  // Storing form values into PHP variables
  //$emailAddress = $_POST["emailAddress"]; // Since method="post" in the form
  //$emailAddress = $_POST["postemail"];
  //$emailAddress=mysql_real_escape_string($emailAddress);
  

  // Inserting these values into the MySQL table
  $query = "SELECT a.iteration_id, a.iteration_name, a.starting_effort, IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4),0) 'effort_done_to_date', a.starting_effort - IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4),0) 'remaining_effort', IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id = a.iteration_id AND state_id = 4),0) 'effort' FROM iteration a LEFT OUTER JOIN backlog_items b ON a.iteration_id = b.iteration_id WHERE b.pbi_effort IS NOT NULL AND a.iteration_start_date < CURDATE() GROUP BY a.iteration_id Order by a.iteration_id, iteration_name, starting_effort - (SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4)";
  
  /*SELECT a.iteration_id, a.iteration_name, a.starting_effort, IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4),0) 'effort_done_to_date', a.starting_effort - IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4),0) 'remaining_effort', sum(pbi_effort) 'effort' FROM iteration a LEFT OUTER JOIN backlog_items b ON a.iteration_id = b.iteration_id WHERE b.pbi_effort IS NOT NULL AND a.iteration_start_date < CURDATE() GROUP BY a.iteration_id Order by a.iteration_id, iteration_name, starting_effort - (SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4)*/
  
  /*SELECT a.iteration_id, a.iteration_name, a.starting_effort, SUM(pbi_effort) 'effort', IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id
AND state_id = 4),0) 'effort_done_to_date', a.starting_effort - IFNULL((SELECT SUM(pbi_effort) FROM backlog_items WHERE iteration_id <= a.iteration_id AND state_id = 4),0) 'remaining_effort' FROM iteration a LEFT OUTER JOIN backlog_items b ON a.iteration_id = b.iteration_id WHERE b.pbi_effort IS NOT NULL AND a.iteration_start_date < CURDATE() GROUP BY a.iteration_id Order by a.iteration_id*/
  
  /*"SELECT b.iteration_id, iteration_name, SUM( PBI_effort ) as 'effort', starting_effort, CalcEffRemaining(b.iteration_id) as 'effort_done_to_date', (starting_effort - CalcEffRemaining(b.iteration_id)) as 'remaining_effort'
	FROM  backlog_items a
	right outer join iteration b on b.iteration_ID = a.iteration_ID
    where b.iteration_start_date <= sysdate()
    and a.state_id=4
	GROUP BY iteration_id, iteration_name, CalcEffRemaining(a.iteration_id), (starting_effort - CalcEffRemaining(a.iteration_id))"; */
  /*
  "SELECT a.iteration_id, iteration_name, SUM( PBI_effort ) as 'effort', starting_effort, CalcEffRemaining(a.iteration_id) as 'effort_done_to_date', (starting_effort - CalcEffRemaining(a.iteration_id)) as 'remaining_effort'
	FROM  backlog_items a
	Inner join iteration b on b.iteration_ID = a.iteration_ID
	GROUP BY iteration_id, iteration_name, CalcEffRemaining(a.iteration_id), (starting_effort - CalcEffRemaining(a.iteration_id))";
  */
  /*
  "SELECT a.iteration_id, iteration_name, SUM( PBI_effort ) as 'effort', starting_effort, (starting_effort - (SUM(pbi_effort))) as 'remaining_effort'
	FROM  backlog_items a
	Inner join iteration b on b.iteration_ID = a.iteration_ID
	GROUP BY iteration_id, iteration_name";*/
/*
	"SELECT a.iteration_id, iteration_name, SUM( PBI_effort ) as 'effort'
	FROM  backlog_items a
	Inner join iteration b on b.iteration_ID = a.iteration_ID
	GROUP BY iteration_id, iteration_name";
  */
  $result = $conn->query($query) or exit("Error code ({$conn->errno}): {$conn->error}");

  //create an array
    //$grapharray[] = array();
    //while($row =mysqli_fetch_assoc($result))
    //{
    //    $grapharray[] = $row;
    //}

	while ($row = mysqli_fetch_array($result, MYSQL_ASSOC)) {
		$grapharray[] = array(
		//$row
			'itName' => $row['iteration_name'],
			'effCom' => $row['effort'],
      'effTot' => $row['starting_effort'],
      'effDone'=> $row['effort_done_to_date'],
      'effRem' => $row['remaining_effort'],
		  );
	}

	echo json_encode($grapharray);
	
	
  //if ($result->num_rows > 0) {
     // output data of each row
		//var_dump(mysql_fetch_assoc($result));
	//	while($row = $result->fetch_assoc()) {
	//		var_dump($row);}
		//	echo "<br> id: ". $row["a.iteration_id"]. " - Name: ". $row["iteration_name"]. " " . $row["SUM( PBI_effort )"] . "<br>";}
	//} 
	//else {
	//	echo "0 results";
	//}
  
	  //header("Location: http://www.wearezeus.co.uk/index.html");


  $conn->close();
?>
