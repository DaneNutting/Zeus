<?php
$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="test"; // Table name 

// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

$sql="SELECT * FROM $tbl_name WHERE project_id = '1'";
$result=mysql_query($sql);
?>

<table width="500" border="0" cellspacing="1" cellpadding="0">
<tr>
<td>
<table width="500" border="1" cellspacing="0" cellpadding="3">
<tr>
<td colspan="5"><strong>List data from mysql </strong> </td>
</tr>

<tr>
<td align="center"><strong>pbi_id</strong></td>
<td align="center"><strong>pbi_title</strong></td>
<td align="center"><strong>pbi_description</strong></td>
<td align="center"><strong>pbi_effort</strong></td>
<td align="center"><strong>priority_id</strong></td>
<td align="center"><strong>state_id</strong></td>
<td align="center"><strong>iteration_id</strong></td>
<td align="center"><strong>project_id</strong></td>
<td align="center"><strong>Update</strong></td>
<td align="center"><strong>Delete</strong></td>
</tr>

<?php
while($rows=mysql_fetch_array($result)){
?>

<tr>
<td><? echo $rows['pbi_id']; ?></td>
<td><? echo $rows['pbi_title']; ?></td>
<td><? echo $rows['pbi_description']; ?></td>
<td><? echo $rows['pbi_effort']; ?></td>
<td><? echo $rows['priority_id']; ?></td>
<td><? echo $rows['state_id']; ?></td>
<td><? echo $rows['iteration_id']; ?></td>
<td><? echo $rows['project_id']; ?></td>

<td align="center"><a href="update.php?id=<? echo $rows['id']; ?>">update</a></td>
<td align="center"><a href="delete_ac.php?id=<? echo $rows['id']; ?>">delete</a></td>
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