<?php
  require_once('../login_system/auth.php');
?>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Zeus Agile Project Management - Your Sprints</title>
<meta name="Description" content="The Sprints page allows you to see and manage all your project's sprints">
<meta name="keywords" content="Zeus agile project management.">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<link rel="shortcut icon" href="../images/ico/favicon.ico">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/popupstyle.css">
<link rel="stylesheet" href="../css/dashboardStyle.css">
<link rel="stylesheet" href="../css/kanbanStyle.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="../js/displaySprints.js"></script>
<script src="../js/createSprint.js"></script>
<script src="../js/velocity.js"></script>
<script src="../js/velocity.ui.js"></script>

<!-- Google Analytics code, need to add this to all pages!-->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-60923636-1', 'auto');
  ga('send', 'pageview');
</script>
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
      	<h1>Sprints</h1>
        <button id ="showCreateSprints" class="formbutton">Create</button>
      </div>
      
      <div id="content2" class="fullwidth clearfix">
      	<div class="oneThirdWidth">
          
          <!--Table of sprints populated on load-->
          <div id="sprintsDiv">
            <div id="currentSprints" class="SprintSelector">Current</div>
            <div id="previousSprints"class="SprintSelector">Previous</div>
            <div id="futureSprints"class="SprintSelector">Future</div>
            <div style = "clear: both; max-height:71vh;">
            <table id="sprintsTable" style="width:100%;">
              <tr>
                <th>Sprint Number</th>
              </tr>
            </table>
            </div>
          </div>
      	</div>
        
        <!-- A div containing more in depth information about a selected PBI -->
        <div class = "twoThirdsWidth">
          <h1></h1><h3></h3><h2></h2>
          
          <div id="board">
              <div id="PbiTitle" class="title">PBI
              </div><div id="ToDoTitle" class="title">To Do
              </div><div id="InProgTitle" class="title">In Progress
              </div><div id="DoneTitle" class="title">Done</div>
          
          </div>
          <!-- Closes board -->
          
        </div>
        <!-- closes twoThirdsWidth -->  
            
      </div>
      <!--closes content2 -->
      
    </div>
    <!--closes maincont-->
    
    <div id="greyOut">
    </div>

    <!-- Popup Div Starts Here -->
      <div id="popupContact">
      </div>
    <!-- Popup Div Ends Here -->
    
    <div id="footer" class="fullwidth clearfix">
    </div>
  
  </div>

</body>
</html>
