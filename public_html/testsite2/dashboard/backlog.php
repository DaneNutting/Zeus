<?php
	//require_once($_SERVER['DOCUMENT_ROOT'] . '/login_system/auth.php' );
  require_once('../login_system/auth.php');
  //include("protect.php");
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
<!--<link rel="stylesheet" href="../chartist-js-master/site/styles/main.scss">-->
<link rel="stylesheet" href="../css/popupstyle.css">
<link rel="stylesheet" href="../css/graphstyle.css"></link>
<!--<link rel="stylesheet" href="../css/signup.css"></link>	 -->
<link rel="stylesheet" href="../css/dashboardStyle.css">
<link rel="stylesheet" href="../css/brynley.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="../js/scroll.js"></script>
<script src="../js/ClickOnClass.js"></script>
<script src="../js/searchPBIs.js"></script>
<script src="../js/createPBI.js"></script>
<script src="../js/deletePBI.js"></script>
<script src="../js/updatePBIs.js"></script>
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
  
    <ul class="navigation">
        <li class="nav-item"><a href="../dashboard.php">Home</a></li>
        <li class="nav-item"><a href="../dashboard/projects.php">Projects</a></li>
        <li class="nav-item"><a href="../dashboard/sprints.php">Sprints</a></li>
        <li class="nav-item"><a href="../dashboard/backlog.php">Backlog</a></li>
        <li class="nav-item"><a href="../dashboard/tasks.php">Tasks</a></li>
    </ul>
    
    <input type="checkbox" id="nav-trigger" class="nav-trigger" />
    <label for="nav-trigger">&#9776;</label>
    
    <div class="site-wrap">
    
    <div id="topNav" class="fullwidth clearfix">
      <div id="leftNav">
        <a href ="../dashboard.php">  
          <span id="cloudicon"><img src="../images/full_white_logo.svg" alt="Zeus agile project management logo" ></span>
            <h1>Zeus</h1>
        </a>    
      </div>
      <div id="rightNav">
        <ul>
          <li>Projects
            <ul>
              <li>Zeus</li>
              <li>Project Atlas</li>
              <li><a href ="../dashboard/projects.php">All Projects</a></li>
            </ul>
          </li>  
          <li>Sprints
            <ul>
              <li>Zeus - Sprint 14</li>
              <li>Atlas - Sprint 5</li>
              <li><a href ="../dashboard/sprints.php">All Sprints</a></li>
            </ul>
          </li>  
          <li>Backlog
            <ul>
              <li>Zeus - PBI 112</li>
              <li>Atlas - PBI 74</li>
              <li><a href ="../dashboard/backlog.php">Product Backlog</a></li>
            </ul>
          </li>
          <li>Tasks
            <ul>
                <li>Atlas - Task 32</li>
                <li>Zeus - Task 8</li>
                <li><a href ="../dashboard/tasks.php">All Tasks</a></li>
              </ul>
          </li>
        </ul>
      </div>
        
    </div>
    
    <div id="maincont">
    
      <div id="contentTitle" class="fullwidth clearfix">
      	<h1>Product Backlog Items</h1>
        <button id ="showCreatePBIForm" class="formbutton">+</button>
      </div>
      <!-- Bar across the screen that holds four drop down menus to add filters to a search for PBI's-->
      <div id="searchBar" class="fullwidth clearfix">
        <form id="projectSearch" method="post" action="../js/searchPBIs">

            <!--<p>Choose a project:</p>
            <select id="projects">
              <option value="Any">Any</option>
            </select>-->
            
            <p>Choose a sprint:</p>
            <select id="sprints">
              <option value="Any">Any</option>
            </select> 
             
            <p>Choose a priority:</p>
            <select id="pbiPriority">
              <option value="Any">Any</option>
            </select>
            
            <p>Choose a state:</p>
            <select id="pbiState">
              <option value="Any">Any</option>
            </select>

          <button type="submit" id="pbiSearch" value="Update" class="formbutton">Update</button>
		    </form>
      </div>
     
     <div id ="content1" class="fullwidth clearfix">
      	<!--<p> content1 </p>-->
       
      </div>
      
      <div id="content2" class="fullwidth clearfix">
      	<div class="oneThirdWidth">
          <!--Table of results populated by searching for PBI's based on filters applied from the search bar above-->
          <div id="pbiSearchResultsDiv">
            <table id="pBIResultstable" style="width:100%;">
              <tr>
                <th>ID</th>
                <th>PBI Title</th>
              </tr>
            </table>
          </div>
      	</div>
        
        <!-- A div containing more in depth information about a selected PBI -->
        <div class = "twoThirdsWidth">
          
          <!--<button id ="showCreatePBIForm" class="formbutton">+</button>-->
          <form id="pbiDetails" class="pbiDetailsForm" method="post" action="../js/updatePBIs">
            <header>
            <img src="../images/ZeusLogo.jpg">
            <div id="pbiDetailsTitle">
            <input id = "pbiID" readonly required>
            <input id = "pbiTitle" title="PBI Title">
            </div>
            <div id="pbiDetailsButtons">
            <button type="submit" id="createPBI" value="Create" class="formbutton">Create</button>
            <button type="submit" id="pbiDetailsButton" value="Update" class="formbutton">Update</button>  
            <button type="button" id="deletePbiButton" value="Delete" class="formbutton">Delete</button>
            <button type="reset" id="pbiDetailsResetButton" value="Cancel" class="formbutton">Cancel</button>
            </div>
            </header>
            
            <div id="pbiDetailsCont">
            <div id="pbiDetailsSubLeft">
            <div id="pbiDetailsDetails">
            <h1 class="pbiDetailsHeadings"> Details </h1>
            <div class="pbiDetailsSec">
            <label class="pbiDetailsDetailsLab" for="pbiEffort">Time</label>
            <input id = "pbiEffort" value="5">  
            </div>
            <div class="pbiDetailsSec">
            <label class="pbiDetailsDetailsLab" for="pbiDetailPriority">Priority</label>
            <select id="pbiDetailPriority">
            </select>
            </div>
            <div class="pbiDetailsSec">
            <label class="pbiDetailsDetailsLab" for="pbiDetailState">State</label>
            <select id = "pbiDetailState">
            </select>
            </div>
            <div class="pbiDetailsSec">
            <label class="pbiDetailsDetailsLab" for="pbiIteration">Iteration</label>
            <select id = "pbiIteration">
            </select>
            </div>
            </div>
            <div id="pbiDetailsDescription">
            <h1 class="pbiDetailsHeadings"> Description </h1>
            <textarea id = "pbiDescription"></textarea>
            </div>
            </div>
            
            <div id="pbiDetailsSubRight">
            
            	<div id="pbiDetailsPersonnel">
                
                    <h1 class="pbiDetailsHeadings"> Personnel </h1>
                    
                    <div class="pbiDetailsDatePerSub">
                    <label class="pbiDetailsDetailsLab" for="pbiReporter">Reporter</label>
                    
                    <a href="#" class="pbiDetailsPersonelSub">
                    <img src="../images/placeholder.jpg">
                    <input id = "pbiReporter" placeholder="Dane Nutting">
                    </a>
                    
                    </div>
                    
                    <div class="pbiDetailsDatePerSub">
                    <label class="pbiDetailsDetailsLab" for="pbiAssignee">Assignee</label>
                    
                    <a href="#" class="pbiDetailsPersonelSub">
                    <img src="../images/placeholder.jpg">
                    <input id = "pbiAssignee" placeholder="Karl Martin">
                    </a>
                     
                    </div>
                
                </div>
                
                <div id="pbiDetailsDates">
                
                    <h1 class="pbiDetailsHeadings"> Dates </h1>
                    
                    <div class="pbiDetailsDatePerSub">
                    <label class="pbiDetailsDetailsLab" for="pbiCreated">Created</label>
                    <input id = "pbiCreated" placeholder="10/Jun/15 4:30 PM">
                    </div>
                    
                    <div class="pbiDetailsDatePerSub">
                    <label class="pbiDetailsDetailsLab" for="pbiUpdated">Updated</label>
                    <input id = "pbiUpdated" placeholder="13/Sep/15 3:33 PM">
                    </div>
                    
                    <div class="pbiDetailsDatePerSub">
                    <label class="pbiDetailsDetailsLab" for="pbiCompleted">Completed</label>
                    <input id = "pbiCompleted" placeholder="13/Sep/15 3:33 PM">  
					</div>
                    
                </div>
            
            </div>
            </div>
            <!--<label for="pbiProject">Project Name</label>
            <select id = "pbiProject">
            </select>-->
            
             
          </form>
          
          <div id="UpdateStatus" style="opacity:0;">
          </div>
          
        </div>
              
      </div>
      
    </div>
    
    <div id="greyOut">
    </div>

    <!-- Popup Div Starts Here -->
      <div id="popupContact">
      </div>
    <!-- Popup Div Ends Here -->
    
    <div id="footer" class="fullwidth clearfix">
    	<p> footer</div>
    </div>
  </div>
  
<script>

function resizeInput() {
    $(this).attr('size', $(this).val().length);
}

$('input[type="text"]')
    // event handler
    .keyup(resizeInput)
    // resize on page load
    .each(resizeInput);

</script>
</body>
</html>
