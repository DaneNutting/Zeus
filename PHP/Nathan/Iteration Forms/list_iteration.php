<?php
$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="iteration"; // Table name 

// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

$sql="SELECT * FROM $tbl_name";
$result=mysql_query($sql);
?>

<table width="800" border="0" cellspacing="1" cellpadding="0">
<tr>
<td>
<table width="800" border="1" cellspacing="0" cellpadding="3">
<tr>
<td colspan="10"><strong>List Iterations </strong> </td>
</tr>

<tr>
<td align="center"><strong>ID</strong></td>
<td align="center"><strong>Name</strong></td>
<td align="center"><strong>Start Date</strong></td>
<td align="center"><strong>End Date</strong></td>
<td align="center"><strong>Release</strong></td>
<td align="center"><strong>Starting Effort</strong></td>
<td align="center"><strong>Update</strong></td>
<td align="center"><strong>Delete</strong></td>
</tr>

<?php
while($rows=mysql_fetch_array($result)){
?>

<tr>
<td><? echo $rows['iteration_id']; ?></td>
<td><? echo $rows['iteration_name']; ?></td>
<td><? echo $rows['iteration_start_date']; ?></td>
<td><? echo $rows['iteration_end_date']; ?></td>
<td><? echo $rows['release_id']; ?></td>
<td><? echo $rows['starting_effort']; ?></td>

<td align="center"><a href="update_iteration.php?iteration_id=<? echo $rows['iteration_id']; ?>">update</a></td>
<td align="center"><a href="delete_iteration_ac.php?iteration_id=<? echo $rows['iteration_id']; ?>">delete</a></td>
</tr>

<?php
}
?>

</table>
</td>
</tr>
</table>

<?php
mysql_close();
?>