<?php

$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="test"; // Table name 

// Connect to server and select databse.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

$sql="SELECT * FROM $tbl_name";
$result=mysql_query($sql);

// Count table rows 
$count=mysql_num_rows($result);
?>

<table width="500" border="0" cellspacing="1" cellpadding="0">
<form name="form1" method="post" action="">
<tr> 
<td>
<table width="500" border="0" cellspacing="1" cellpadding="0">

<tr>
<td align="center"><strong>Id</strong></td>
<td align="center"><strong>testfield1</strong></td>
<td align="center"><strong>testfield2</strong></td>
<td align="center"><strong>testfield3</strong></td>
</tr>

<?php
while($rows=mysql_fetch_array($result)){
?>

<tr>
<td align="center">
<? $id[]=$rows['id']; ?><? echo $rows['id']; ?>
</td>
<td align="center">
<input name="testfield1[]" type="text" id="testfield1" value="<? echo $rows['testfield1']; ?>">
</td>
<td align="center">
<input name="testfield2[]" type="text" id="testfield2" value="<? echo $rows['testfield2']; ?>">
</td>
<td align="center">
<input name="testfield3[]" type="text" id="testfield3" value="<? echo $rows['testfield3']; ?>">
</td>
</tr>

<?php
}
?>

<tr>
<td colspan="4" align="center"><input type="submit" name="Submit" value="Submit"></td>
</tr>
</table>
</td>
</tr>
</form>
</table>

<?php

// Check if button name "Submit" is active, do this 
if($Submit){
for($i=0;$i<$count;$i++){
$sql1="UPDATE $tbl_name SET testfield1='$testfield1[$i]', testfield2='$testfield2[$i]', testfield3='$testfield3[$i]' WHERE id='$id[$i]'";
$result1=mysql_query($sql1);
}
}

if($result1){
header("location:update_multiple.php");
}
mysql_close();
?>