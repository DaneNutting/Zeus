// JavaScript Document
 $(function () {
	
    $(".formbutton").click(function(e) {
    	e.preventDefault();
      // validate and process form here 
	  var email = document.getElementById("emailAddress").value;
	  var status = document.getElementById("success");

	  if (!email){
	  	status.innerHTML = "Please enter an email address";
		status.style.opacity = 1;
	  	return false;
	  }			

	  //alert (email);return false;

	  $.ajax({
		type: "POST",
		url: "testcondev.php",
		data: {postemail:email},
		success: function() {
			console.log('success');
			status.innerHTML = "Thanks for your support, we'll let you know how we're getting on!";
			status.style.opacity = 1;
		},
		error: function() {
			console.log('error')
			status.innerHTML = "Sorry, we couldn't save your email address at this time.";
			status.style.opacity = 1;
		}
	  });
	
   });
    return false;
});