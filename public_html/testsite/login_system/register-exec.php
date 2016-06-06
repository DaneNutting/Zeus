<?php
	//Start session
	session_start();
	
	//Include database connection details
	//require_once('config.php');
    include('DatabaseCon.php');
	
	//Array to store validation errors
	$errmsg_arr = array();
	
	//Validation error flag
	$errflag = false;
	
	// Create connection
  $conn = new mysqli($host, $user_name, $pwd, $dbName);
  // Check connection
  if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
  } 
	
	//Function to sanitize values received from the form. Prevents SQL injection
	function clean($conn, $data)  {
		$data = trim($data);
		if(get_magic_quotes_gpc()) {
			$data = stripslashes($data);
		}
		$data = mysqli_real_escape_string($conn, $data);
    return $data;
	}
	
	function getRandomString($length) {
        $validCharacters = "ABCDEFGHIJKLMNPQRSTUXYVWZ123456789";
        $validCharNumber = strlen($validCharacters);
        $result = "";
    
        for ($i = 0; $i < $length; $i++) {
            $index = mt_rand(0, $validCharNumber - 1);
            $result .= $validCharacters[$index];
        }
    return $result;
    }
    
    //Store a random string into a variable
    $user_password = getRandomString(20);
	
	//Sanitize the POST values
	$user_forename = clean($conn, $_POST['user_forename']);
	$user_surname = clean($conn, $_POST['user_surname']);
	$user_email = clean($conn, $_POST['user_email']);
	$organisation = clean($conn, $_POST['organisation']);
	
	//Create a unique salt. This will never leave PHP unencrypted.
	$salt = "498#2D83B631%3800EBD!801600D*7E3CC13";
    $encrypt_pass = hash('sha512', $salt.$user_password);

	
	//Input Validations
	if($user_forename == '') {
		$errmsg_arr[] = 'First name missing';
		$errflag = true;
	}
	if($user_surname == '') {
		$errmsg_arr[] = 'Last name missing';
		$errflag = true;
	}
	if($user_email == '') {
		$errmsg_arr[] = 'Email missing';
		$errflag = true;
	}
	if($organisation == '') {
		$errmsg_arr[] = 'Organisation missing';
		$errflag = true;
	}
	
	//Check for duplicate login ID
	if($login != '') {
		$qry = "SELECT * FROM users2 WHERE user_email='$user_email'";
		$result=mysqli_query($conn, $qry);
		if($result) {
			if(mysqli_num_rows($result) > 0) {
				$errmsg_arr[] = 'Email already in use';
				$errflag = true;
			}
			@mysqli_free_result($result);
		}
		else {
			die("Query failed");
		}
	}
	
	//If there are input validations, redirect back to the registration form
	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: register-form.php");
		exit();
	}

	//Create INSERT query
	$qry = "INSERT INTO users2 (user_forename, user_surname, user_email, user_password, org_id) VALUES('$user_forename','$user_surname','$user_email','$encrypt_pass', (SELECT org_id FROM organisation WHERE org_name = '$organisation'))";
	$result = mysqli_query($conn, $qry);
	
	//Check whether the query was successful or not
	if($result) {
		$uri = 'http://'. $_SERVER['HTTP_HOST'] ;
		$to = $user_email;
                $subject = 'Registration on wearezeus.co.uk';
								
				/* Let's prepare the message for the e-mail */
				$message = 'Dear '.$user_forename.',
				
				You have been registered as a user on wearezeus.co.uk
				
				Username: '.$user_email.'

				Your new password : '.$user_password.'
				 
				Now you can login with this email and password at '.$uri.'/login_system/reset.php';
					 
				/* Send the message using mail() function */
					if(mail($to, $subject, $message ))
					{
						echo "Email successfully sent.";
					}
			 
		exit();
	}else {
		die("Query failed");
	}
    
    $conn->close();
?>