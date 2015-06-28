<?php

$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="iteration"; // Table name 

// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

// Get values from form 
$iteration_id=$_POST['iteration_id'];
$iteration_name=$_POST['iteration_name'];
$iteration_start_date=$_POST['iteration_start_date'];
$iteration_end_date=$_POST['iteration_end_date'];
$release_id=$_POST['release_id'];
$starting_effort=$_POST['starting_effort'];

// Insert data into mysql 
$sql="INSERT INTO $tbl_name(iteration_id, iteration_name, iteration_start_date, iteration_end_date, release_id, starting_effort) VALUES('NULL', '$iteration_name', '$iteration_start_date', '$iteration_end_date', '$release_id', '$starting_effort')";
$result=mysql_query($sql);

// if successfully insert data into database, displays message "Successful". 
if($result){
echo "Successful";
echo "<BR>";
echo "<a href='insert_iteration.php'>Back to main page</a>";
}

else {
echo "ERROR";
}
?> 

<?php 
// close connection 
mysql_close();
?>