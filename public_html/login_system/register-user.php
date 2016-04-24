<?php

//Display the form for entering user's email address
    if(!isset($_GET['email'])){
        ?>
        <!DOCTYPE html>
            <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
            <meta charset="UTF-8">
            <title>Zeus - Login</title>
            <meta name="Description" content="Zeus Agile Project Management Dashboard - Login Page">
            <meta name="keywords" content="Zeus agile project management Login">
            <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
            
            <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144.png">
            <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114.png">
            <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72.png">
            <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57.png">
            <link rel="shortcut icon" href="../images/ico/favicon.ico">
            <link href="http://fonts.googleapis.com/css?family=Roboto:400,300" rel="stylesheet" type="text/css">	
            <link rel="stylesheet" href="../css/login.css">
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
            <script src="../js/velocity.js"></script>
            <script src="../js/velocity.ui.js"></script>
            
            </head>
            
            <body>
            
            <div id="hero">
                    <div class="container clearfix">
                        <div class="copy">
                    <div class="login-card">
                        <h1>Add User</h1><br>
                        
                        <form id="loginForm" name="loginForm" method="get" action="register-user.php">
                        <input type="text" name="email" id="email" placeholder="Enter Email Address">
                        <input type="checkbox" name="checkbox" id="checkbox">
                        <input type="submit" name="login" class="login login-submit" value="Send Email">
                        </form>
                        
                    </div>  	
                        </div>	
                    </div>			
                </div>
            </body>
        </html>
<?php
        exit();
    }
    
    if( !isset($_GET['checkbox'])){
    //Store the email in a variable
    $email=$_GET['email'];
    
    //Include connection details
    include('../php/DatabaseCon.php');
    
    // Create connection
    $conn = new mysqli($host, $user_name, $pwd, $dbName);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 
    
    //Query to check whether the user exists within the database.
    $q="SELECT user_email FROM users2 WHERE user_email='".$email."'";
    $r=mysqli_query($conn, $q);
    $n=mysqli_num_rows($r);
    
    if($n==1){
        echo "Email already exists within wearezeus."; 
        die();
    } 
    
    //If the users email does exist in the database then send the following email with a link with the randomly generated token so that only that users email link can reset the password   
    function mailresetlink($to){
        //Subject line
        $subject = "Forgot Password on wearezeus.co.uk";
        //The website that you have requested this for
        $uri = 'http://'. $_SERVER['HTTP_HOST'] ;
        $message = '
            <html>
                <head>
                    <title>Invitation to wearezeus.co.uk</title>
                </head>
                <body>
                    <p>Hi,<br>
                    <br>
                    You have received this email as an administrator wants you to join wearezeus.co.uk - Agile Project Management.<br>
                    <br>
                    Click on the given link to enter your details <a href="'.$uri.'/login_system/register-form.php">Enter Details</a><br>
                    <br>
                    The Zeus Team</p>
                </body>
            </html>';
            
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
        //The email address that it was sent from
        $headers .= 'From: Admin<group@wearezeus.co.uk>' . "\r\n";
        
        if(mail($to,$subject,$message,$headers)){
            echo "Email sent to user. <b>".$to."</b>"; 
        }
    }
    
    if(isset($_GET['email']))mailresetlink($email,$token);
    }
    else{
        echo "checkbox ticked";
    }
?>