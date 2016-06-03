<?php
    //Make sure the user is logged in
    require_once('../login_system/auth.php');
    require_once('../php/DatabaseCon.php');
  
    //Start the session
    session_start();
?>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Zeus Agile Project Management - Your Backlog</title>
<meta name="Description" content="Backlog page search for, edit and create new product backlog items">
<meta name="keywords" content="Zeus agile project management.">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<link rel="shortcut icon" href="../images/ico/favicon.ico">
<link rel="stylesheet" href="../chartist-js-master/dist/chartist.min.css">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/popupstyle.css">
<link rel="stylesheet" href="../css/graphstyle.css">
<link rel="stylesheet" href="../css/dashboardStyle.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="../js/ClickOnClass.js"></script>
<script src="../js/displayProjects.js"></script>
<script src="../js/velocity.js"></script>
<script src="../js/velocity.ui.js"></script>

<!-- Google Analytics code, need to add this to all pages!-->
</head>

<body>

  <div id="wrapper" class="fullwidth clearfix">
    
    <div id="topNav" class="fullwidth clearfix">
      <div id="leftNav">
        <a href ="../dashboard.php">  
          <span id="cloudicon"><img src="../images/full_white_logo.svg" alt="Zeus agile project management logo" ></span>
            <h1>Dashboard</h1>
        </a>    
      </div>
      <div id="rightNav">
        <ul>
          <a href ="../dashboard/projects.php"><li>Projects
          </li></a>  
          <a href ="../dashboard/sprints.php"><li>Sprints
          </li></a>  
          <a href ="../dashboard/backlog.php"><li>Backlog
          </li></a>
          <a href ="../dashboard/tasks.php"><li>Tasks
          </li></a>
        </ul>
      </div>
        
    </div>
    
    <div id="maincont">
    
      <div id="contentTitle" class="fullwidth clearfix">
      	<h1>Projects</h1>
      </div>
     
     <!--<div id ="content1" class="fullwidth clearfix">
      	<p> content1 </p>-->
       
      </div>
      
      <div id="projectContent" class="fullwidth clearfix">
              
      </div>
      
    </div>
    
    <div id="greyOut">
    </div>

    <!-- Popup Div Starts Here -->
      <div id="popupContact">
      </div>
    <!-- Popup Div Ends Here -->
    
    <div id="footer" class="fullwidth clearfix">
    </div>
  
  <!--</div>-->

</body>
</html>
