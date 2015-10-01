/*================================================================================================================*/
/*================================================================================================================*/
// JavaScript to process the update of any PBI displayed in the PBI form
/*================================================================================================================*/
/*================================================================================================================*/

 $(function () {
	 
	$("#deletePbiButton").click(function(e) {	
		e.preventDefault() 
		//Variables 
		var updateID = document.getElementById("pbiID").value;
		var status = document.getElementById("UpdateStatus");
		
		//Check if the ID field is empty before submitting - if it is then do not submit the data
		//And provide a suitable error message
		if (updateID == null || updateID == ""){
			//style and add content to a status div that pops up to provide feedback on how the update went
				$("#greyOut").velocity("transition.fadeIn")
				.velocity({opacity:0.9});
				$("#popupContact").velocity("transition.bounceUpIn")
				.velocity({opacity:1});
				$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">We could not delete this PBI, the ID field is empty.</h1> <br> <a href="#" id="msgClose">Cancel</a>');
				
				//Close popup div and remove elements from the div so they don't stack up on each other$("#msgClose").click(function(e) {
				$("#msgClose").click(function(e) {
					e.preventDefault();
					$("#popupContact").velocity("transition.bounceDownOut");
					$("#greyOut").velocity("transition.fadeOut",{delay:200});
					$("#msgImg").remove();
					$("#msgH1").remove();
					$("#msgClose").remove();			
				});
			return false;
		}
		//If the ID isn't Null then submit the update
	  	else{
		//Ajax request to update the current PBI with whatever new value has been entered in to the form
		$.ajax({
			type: "POST",
			url: "../php/DeletePBI.php",
			data: {
				postedID:updateID,
			},
			success: function(results) {
				//style and add content to a status div that pops up to provide feedback on how the update went
				$("#greyOut").velocity("transition.fadeIn")
				.velocity({opacity:0.9});
				$("#popupContact").velocity("transition.bounceUpIn")
				.velocity({opacity:1});
				$("#popupContact").prepend('<img id="msgImg" src="../images/tick.svg" /> <h1 id="msgH1">Your PBI was successfully deleted!</h1> <br> <a href="#" id="msgClose">Cancel</a>');
				
				//Close popup div and remove elements from the div so they don't stack up on each other
				$("#msgClose").click(function(e) {
					e.preventDefault();
					$("#popupContact").velocity("transition.bounceDownOut");
					$("#greyOut").velocity("transition.fadeOut",{delay:200});
					$("#msgImg").remove();
					$("#msgH1").remove();
					$("#msgClose").remove();			
				});
			},
			error: function(results) {
				//style and add content to a status div that pops up to provide feedback on how the update went
				$("#greyOut").velocity("transition.fadeIn")
				.velocity({opacity:0.9});
				$("#popupContact").velocity("transition.bounceUpIn")
				.velocity({opacity:1});
				$("#popupContact").prepend('<img id="msgImg" src="../images/cross.svg" /> <h1 id="msgH1">Sorry we could not delete your PBI.</h1> <br> <a href="#" id="msgClose">Cancel</a>');
				
				//Close popup div and remove elements from the div so they don't stack up on each other$("#msgClose").click(function(e) {
				$("#msgClose").click(function(e) {
					e.preventDefault();
					$("#popupContact").velocity("transition.bounceDownOut");
					$("#greyOut").velocity("transition.fadeOut",{delay:200});
					$("#msgImg").remove();
					$("#msgH1").remove();
					$("#msgClose").remove();			
				});
			}
		});
	  }
	});
	return false;
 });