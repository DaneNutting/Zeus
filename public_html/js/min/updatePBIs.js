$(function(){$("#pbiDetailsButton").click(function(e){e.preventDefault();var updateID=document.getElementById("pbiID").value;var updateTitle=document.getElementById("pbiTitle").value;var updateDesc=document.getElementById("pbiDescription").value;var updateEffort=document.getElementById("pbiEffort").value;var updatePriority=document.getElementById("pbiDetailPriority").value;var updateState=document.getElementById("pbiDetailState").value;var updateIteration=document.getElementById("pbiIteration").value;if(updateID==null||updateID==""){$("#greyOut").velocity("transition.fadeIn").velocity({opacity:0.9});$("#popupContact").velocity("transition.bounceDownIn").velocity({opacity:1});$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">Sorry we could not update your PBI.</h1> <br> <a href="#" id="msgClose">OK</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();});return false;}else{$("#greyOut").velocity("transition.fadeIn").velocity({opacity:0.9});$("#popupContact").velocity("transition.bounceDownIn").velocity({opacity:1});$("#popupContact").prepend('<img id="msgImg" src="../images/query.svg" /> <h1 id="msgH1">Are you sure you want to update this PBI?</h1> <br> <a href="#" id="confirmButton">Yes</a> <a href="#" id="msgClose">No</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();$("#confirmButton").remove();});$("#confirmButton").click(function(e){e.preventDefault();$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();$("#confirmButton").remove();$.ajax({type:"POST",url:"../php/UpdatePBI.php",data:{postedID:updateID,postedTitle:updateTitle,postedDesc:updateDesc,postedEffort:updateEffort,postedPriority:updatePriority,postedState:updateState,postedIteration:updateIteration,},success:function(results){$("#popupContact").prepend('<img id="msgImg" src="../images/tick.svg" /> <h1 id="msgH1">Your PBI was successfully updated!</h1> <br> <a href="#" id="msgClose">OK</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();});},error:function(results){$("#greyOut").velocity("transition.fadeIn").velocity({opacity:0.9});$("#popupContact").velocity("transition.bounceDownIn").velocity({opacity:1});$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">Sorry we could not update your PBI.</h1> <br> <a href="#" id="msgClose">OK</a>');$("#msgClose").click(function(e){e.preventDefault();$("#popupContact").velocity("transition.bounceUpOut");$("#greyOut").velocity("transition.fadeOut",{delay:200});$("#msgImg").remove();$("#msgH1").remove();$("#msgClose").remove();});}});});}});return false;});