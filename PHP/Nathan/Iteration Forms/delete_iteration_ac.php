<?php
$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="iteration"; // Table name 

// Connect to server and select databse.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

// get value of id that sent from address bar 
$iteration_id=$_GET['iteration_id'];

// Delete data in mysql from row that has this id 
$sql="DELETE FROM $tbl_name WHERE iteration_id='$iteration_id'";
$result=mysql_query($sql);

// if successfully deleted
if($result){
	echo "Deleted Successfully";
	echo "<BR>";
	echo "<a href='list_iteration.php'>Return to Iterations</a>";
}
	else {
	echo "ERROR";
	echo $id;
	echo $sql;
}
?> 

<?php
// close connection 
mysql_close();
?>