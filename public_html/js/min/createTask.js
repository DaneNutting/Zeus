$(function(){$("#showCreatePBIForm").click(function(e){e.preventDefault();$('#pbiDetails').velocity({opacity:1},{duration:200});$('#createPBI').show();$('#createPBI').css("visibility","visible");$('#createPBI').velocity({opacity:1},{duration:0});$('#pbiDetailsButton').hide();$('#pbiDetailsButton').css("visibility","hidden");$('#pbiDetailsButton').velocity({opacity:0},{duration:0});$('#deletePbiButton').hide();$('#deletePbiButton').css("visibility","hidden");$('#deletePbiButton').velocity({opacity:0},{duration:0});document.getElementById("taskID").value="";document.getElementById("taskTitle").value="";document.getElementById("pbiTitle").value="";document.getElementById("assignee").value="";document.getElementById("taskDescription").value="";document.getElementById("estimatedTime").value="";document.getElementById("timeSpent").value="";document.getElementById("taskDetailState").value="";document.getElementById("taskIteration").value="";});$("#createPBI").click(function(e){e.preventDefault()
var updateID=document.getElementById("taskID").value;var updateTitle=document.getElementById("taskTitle").value;var updatePbiTitle=document.getElementById("pbiTitle").value;var updateAssignee=document.getElementById("assignee").value;var updateDesc=document.getElementById("taskDescription").value;var updateEstimatedTime=document.getElementById("estimatedTime").value;var updateTimeSpent=document.getElementById("timeSpent").value;var updateState=document.getElementById("taskDetailState").value;var updateIteration=document.getElementById("taskIteration").value;if(updateTitle==null||updateTitle==""){$("#greyOut").velocity("transition.fadeIn").velocity({opacity:0.9});$("#popupContact").velocity("transition.bounceDownIn").velocity({opacity:1});$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">Your task needs a Title!</h1> <br> <a href="#" id="msgClose">OK</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();});return false;}else{$.ajax({type:"POST",url:"../php/CreateTask.php",data:{postedID:updateID,postedTitle:updateTitle,postedPbiTitle:updatePbiTitle,postedAssignee:updateAssignee,postedDesc:updateDesc,postedEstimatedTime:updateEstimatedTime,postedTimeSpent:updateTimeSpent,postedState:updateState,postedIteration:updateIteration,},success:function(results){$("#greyOut").velocity("transition.fadeIn").velocity({opacity:0.9});$("#popupContact").velocity("transition.bounceDownIn").velocity({opacity:1});$("#popupContact").prepend('<img id="msgImg" src="../images/tick.svg" /> <h1 id="msgH1">Your task was successfully created!</h1> <br> <a href="#" id="msgClose">OK</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();});console.log(results);},error:function(results){$("#greyOut").velocity("transition.fadeIn").velocity({opacity:0.9});$("#popupContact").velocity("transition.bounceDownIn").velocity({opacity:1});$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">Sorry we could not create your PBI.</h1> <br> <a href="#" id="msgClose">OK</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();});console.log(results);}});}});return false;});