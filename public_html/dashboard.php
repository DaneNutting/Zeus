<?php
   require_once('login_system/auth.php');

?>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Zeus Agile Project Management - The Dashboard</title>
<meta name="Description" content="Zeus Agile Project Management Dashboard - The dashboard is where you can see your project metrics. Burndown Graphs, Velocity Graphs and any add in's that you purchased">
<meta name="keywords" content="Zeus agile project management.">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="stylesheet" href="chartist-js-master/dist/chartist.min.css">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/graphstyle.css"></link>
<link rel="stylesheet" href="css/dashboardStyle.css"></link>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="chartist-js-master/dist/chartist.min.js"></script>
<script src="js/chartistGraph.js"></script> 
<script src="js/min/pbiData.js"></script>
<script src="js/chartistPies.js"></script>

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
    	    <span id="cloudicon"><img src="images/full_white_logo.svg" alt="Zeus agile project management logo" ></span>
          <h1>Dashboard</h1>
        </a>
      </div>
      <div id="rightNav">
        <ul>
          <a href ="../dashboard/projects.php"><li>Projects
            <!--<ul>
              <li>Zeus</li>
              <li>Project Atlas</li>
              <li><a href ="../dashboard/projects.php">All Projects</a></li>
            </ul>-->
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
      	<p>Zeus Dashboard</p>
      </div>
      
      <div id ="content1" class="fullwidth clearfix">
        <div class="graph-container">
          <p>Project Burndown</p>
          <div class="ct-chart ct-golden-section" id="chart1"></div> 
        </div> 
        <div class="graph-container">
          <p>Effort Done per Sprint</p>
          <div class="ct-chart ct-golden-section" id="chart2"></div> 
        </div>
      </div>
      
      <div id="content2" class="fullwidth clearfix">
        <div id="pieContainer1" class="ct-chart pieContainer"> <h1>Effort Done</h1> </div>
        <div id="pieContainer2" class="ct-chart pieContainer"> <h1>Sprint Hours Complete</h1> </div>
        <div id="pieContainer3" class="ct-chart pieContainer"> <h1>Personal Hours Complete</h1> </div>
      </div>
      
      <div id="content3" class="fullwidth clearfix">
      	<p> PBIs This Sprint</p> 
        <div id="test">
          <table id="testtable" style="width:100%;">
            <tr>
              <th>ID</th>
              <th>PBI Title</th>
              <th>Description</th>
              <th>Effort</th>
              <th>Priority</th>
              <th>State</th>
            </tr>
          </table>
        </div>   
      </div>
      
    </div>

    <div id="footer" class="fullwidth clearfix">
    </div>
  
  </div>

</body>
</html>
