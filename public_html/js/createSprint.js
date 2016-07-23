
/*================================================================================================================*/
/*================================================================================================================*/
// JavaScript to create sprints
/*================================================================================================================*/
/*================================================================================================================*/

 $(function () {
	 
	 //Listen for the + button on the sprints page to be clicked
     $("#showCreateSprints").click(function(e) {
		e.preventDefault();
		
		//grey out the screen and show a "pop up" with a form using velocity 
		$("#popupContact").prepend(
			'<div id="popupFormContainer"><h1>Create Sprint</h1><form id="SprintCreateForm" class="pbiDetailsForm" method="post" action="../js/updatePBIs"><div class="createSprintForm"><label for="sprintName">Title</label><input id = "sprintName" title="sprintName"></div>'+ 
            '<div class="createSprintForm"><label for="startDate">Start Date</label><input id = "startDate" title="startDate" type="date"></div>'+
            '<div class="createSprintForm"><label for="endDate">End Date</label><input id = "endDate" title="endDate" type="date"></div></form>'+          
          	'<div class="createSprintYesNo"><a href="#" id="confirmButton">Create</a> <a href="#" id="msgClose">Cancel</a></div></div></div>'
		)
		$("#popupFormContainer").show();
		$("#greyOut").velocity("transition.fadeIn")
		.velocity({opacity:0.9});
		$("#popupContact").velocity("transition.bounceDownIn")
		.velocity({opacity:1});
		
		//if the No button is click hide the grey out and the pop up
		$("#msgClose").click(function(e) {
			e.preventDefault();
			$("#popupContact").velocity("transition.bounceUpOut");
			$("#greyOut").velocity("transition.fadeOut",{delay:200});
			$("#popupFormContainer h1").remove();
			$("#SprintCreateForm").remove();
			$(".createSprintYesNo").remove();		
		});
		
		//if the yes button is clicked get the values entered and pass them to the php file for processing	
		$("#confirmButton").click(function(e) {
			e.preventDefault();
			
			//prevents the ajax call event from bubbling up and calling the AJAX twice
			e.stopImmediatePropagation();
			var sprintName = document.getElementById("sprintName").value;
			var startDate = document.getElementById("startDate").value;
			var endDate = document.getElementById("endDate").value;
			
			//Ajax request to create a sprint with the info entered into the form
			$.ajax({
				type: "POST",
				url: "../php/CreateSprint.php",
				data: {
					postedName:sprintName,
					postedStartDate:startDate,
					postedEndDate:endDate
				},
				success: function(results) {
					console.log(results);
					$("#popupFormContainer").hide();
					$("#popupContact").prepend('<img id="msgImg" src="../images/tick.svg" /> <h1 id="msgH1">Sprint successfully created!</h1> <br> <a href="#" id="msgClose">OK</a>');
					
					//Close popup div and remove elements from the div so they don't stack up on each other
					$("#msgClose").click(function(e) {
						e.preventDefault();
						$("#popupContact").velocity("transition.bounceUpOut");
						$("#greyOut").velocity("transition.fadeOut",{delay:200});
						$("#msgImg").remove();
						$("#msgH1").remove();
						$("#msgClose").remove();
						$("br").remove();
                        $('#SprintCreateForm').trigger("reset");			
					});
				},
				error: function(results) {
					console.log(results);
					//style and add content to a status div that pops up to provide feedback on how the update went
					$("#greyOut").velocity("transition.fadeIn")
					.velocity({opacity:0.9});
					$("#popupContact").velocity("transition.bounceDownIn")
					.velocity({opacity:1});
					$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">Sorry we could not update your task.</h1> <br> <a href="#" id="msgClose">OK</a>');
					
					//Close popup div and remove elements from the div so they don't stack up on each other$("#msgClose").click(function(e) {
					$("#msgClose").click(function(e) {
						e.preventDefault();
						$("#popupContact").velocity("transition.bounceUpOut");
						$("#greyOut").velocity("transition.fadeOut",{delay:200});
						$("#msgImg").remove();
						$("#msgH1").remove();
						$("#msgClose").remove();			
					});
				}
			});
		});
	  	
	});
	return false;
 });