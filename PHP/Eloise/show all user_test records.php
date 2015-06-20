<?php

$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="users_test"; // Table name

// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

// Retrieve data from database 
$sql="SELECT * FROM $users_test";
$result=mysql_query($sql);
?>
 
<table width="400" border="1" cellspacing="0" cellpadding="3">
 
<?php
// Start looping rows in mysql database.
while($rows=mysql_fetch_array($result)){
?>

<tr>
<td width="10%"><? echo $rows['user_id']; ?></td>
<td width="30%"><? echo $rows['user_forename']; ?></td>
<td width="30%"><? echo $rows['user_surname']; ?></td>
<td width="30%"><? echo $rows['user_email']; ?></td>
<td width="30%"><? echo $rows['user_password']; ?></td>
<td width="30%"><? echo $rows['user_photo']; ?></td>
<td width="30%"><? echo $rows['user_role_id']; ?></td>
</tr>

<?php
// close while loop 
}
</table>
?>

<?php
// close MySQL connection 
mysql_close();
?>