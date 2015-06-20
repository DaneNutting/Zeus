// Create the form
<table width="300" border="0" align="center" cellpadding="0" cellspacing="1">
<tr>
<td><form name="form1" method="post" action="insert_ac.php">
<table width="100%" border="0" cellspacing="1" cellpadding="3">
<tr>
<td colspan="3"><strong>New User Registration </strong></td>
</tr>
<tr>
<td width="71">Forename</td>
<td width="6">:</td>
<td width="301"><input name="Forename" type="text" id="Forename"></td>
</tr>
<tr>
<td>Surname</td>
<td>:</td>
<td><input name="Surname" type="text" id="Surname"></td>
</tr>
<tr>
<td>Email</td>
<td>:</td>
<td><input name="Email" type="text" id="Email"></td>
</tr>
<tr>
<td>Password</td>
<td>:</td>
<td><input name="Password" type="text" id="Password"></td>
</tr>
<tr>
<td>Profile Picture</td>
<td>:</td>
<td><input name="Profile Picture" type="text" id="Profile Picture"></td>
</tr>
<tr>
<td colspan="3" align="center"><input type="submit" name="Register" value="Register"></td>
</tr>
</table>
</form>
</td>
</tr>
</table>

// Insert into table
<?php

$host="10.168.1.92"; // Host name 
$username="wearezeu_phpserv"; // Mysql username 
$password="0!ZeusPhP!0"; // Mysql password 
$db_name="wearezeu_test01"; // Database name 
$tbl_name="users_test"; // Table name
// Connect to server and select database.
mysql_connect("$host", "$username", "$password")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");

// Get values from form 
$user_id=$_POST['user_id'];
$Forename=$_POST['Forename'];
$Surname=$_POST['Surname'];
$Email=$_POST['Email'];
$Password=$_POST['Password'];
$Profile_Picture=$_POST['Profile_Picture'];
$user_role_id=$_POST['user_role_id'];

// Insert data into mysql 
$sql="INSERT INTO $users_test(user_id, user_forename, user_surname, user_email, user_password, user_photo, user_role_id)VALUES('$User_id', '$Forename', '$Surname', '$Email', '$Password', '$Profile_Picture', '$User_role_id')";
$result=mysql_query($sql);

// if successfully insert data into database, displays message "You have successfully registered". 
if($result){
echo "You have successfully registered";
echo "<BR>";
echo "<a href='insert.php'>Back to main page</a>";
}

else {
echo "ERROR";
}
?> 

<?php 
// close connection 
mysql_close();
?>
