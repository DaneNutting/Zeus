<?php
$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="iteration"; // Table name

// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

// get value of id that sent from address bar
$iteration_id=$_GET['iteration_id'];

// Retrieve data from database 
$sql="SELECT * FROM $tbl_name WHERE iteration_id='$iteration_id'";
$result=mysql_query($sql);
$rows=mysql_fetch_array($result);
?>

<table width="700" border="0" cellspacing="1" cellpadding="0">
<tr>
<form name="form1" method="post" action="update_iteration_ac.php">
<td>
<table width="100%" border="0" cellspacing="1" cellpadding="0">
<tr>
<td>&nbsp;</td>
<td colspan="3"><strong>Update Iteration</strong> </td>
</tr>
<tr>
<td align="center">&nbsp;</td>
<td align="center">&nbsp;</td>
<td align="center">&nbsp;</td>
<td align="center">&nbsp;</td>
<td align="center">&nbsp;</td>
<td align="center">&nbsp;</td>
</tr>
<tr>
<td align="center">&nbsp;</td>
<td align="center"><strong>Name</strong></td>
<td align="center"><strong>Start Date</strong></td>
<td align="center"><strong>End Date</strong></td>
<td align="center"><strong>Release</strong></td>
<td align="center"><strong>Starting Effort</strong></td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="center">
<input name="iteration_name" type="text" id="iteration_name" value="<? echo $rows['iteration_name']; ?>">
</td>
<td align="center">
<input name="iteration_start_date" type="date" id="iteration_start_date" value="<? echo $rows['iteration_start_date']; ?>" size="15">
</td>
<td>
<input name="iteration_end_date" type="date" id="iteration_end_date" value="<? echo $rows['iteration_end_date']; ?>" size="15">
</td>
<td>
<input name="release_id" type="number" id="release_id" value="<? echo $rows['release_id']; ?>" size="15">
</td>
<td>
<input name="starting_effort" type="number" id="starting_effort" value="<? echo $rows['starting_effort']; ?>" size="15">
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>
<input name="iteration_id" type="hidden" id="iteration_id" value="<? echo $rows['iteration_id']; ?>">
</td>
<td align="center">
<input type="submit" name="Submit" value="Submit">
</td>
<td>&nbsp;</td>
</tr>
</table>
</td>
</form>
</tr>
</table>

<?php
// close connection 
mysql_close();
?>