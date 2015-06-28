<?php
$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="iteration"; // Table name 

// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

$iteration_name = $_POST["iteration_name"];
$iteration_start_date = $_POST["iteration_end_date"];
$iteration_end_date = $_POST["iteration_end_date"];
$release_id = $_POST["release_id"];
$starting_effort = $_POST["starting_effort"];
$iteration_id = $_POST['iteration_id'];

// update data in mysql database 
$sql="UPDATE $tbl_name SET iteration_name='$iteration_name', iteration_start_date='$iteration_start_date', iteration_end_date='$iteration_end_date', release_id='$release_id', starting_effort='$starting_effort' WHERE iteration_id='$iteration_id'";
$result=mysql_query($sql);

// if successfully updated. 
if($result){
	echo "Successful";
	echo "<BR>";
	echo "<a href='list_iteration.php'>Return to Iterations</a>";
	
	}
else {
// display error
	echo "ERROR";
	
	}
?>