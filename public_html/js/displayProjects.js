/*================================================================================================================*/
/*================================================================================================================*/
// JavaScript to display projects based on what projects the currently signed in user has access to 
/*================================================================================================================*/
/*================================================================================================================*/

$.ajax({
    dataType: "json",
    url: "../php/DisplayProjects.php",
    //if the ajax call is successful run the function load - 
    //this contains a parent function for everything else in this JS file
    success: function normalload (result) {
        populateProjects(result);
    }            
});

//This function acts as a parent function and is fired on the success call back of the above AJAX request
function populateProjects(results) {
    var clickedPBIID;
    
    //Process the results of the query based on the parameters supplied from drop down box
    $.each(results, function (key, value) {
        if(value.imageAddress != null){
            $('#projectContent').append('<div id="' + value.projectID +'" class="project">'+
                '<img src =' + value.imageAddress + '>' +
                '<h1>'+
                    value.projectName + 
                '</h1>'+
                '<p>'+
                    value.description +
                '</p>' + 
                '<h2> <b> Project Lead: </b>'+ value.projectLead +'</h2>' +   
            '</div>'
            );
        }
        else{
            $('#projectContent').append('<div id="' + value.projectID +'" class="project">'+
                '<h1>'+
                    value.projectName + 
                '</h1>'+
                '<p>'+
                    value.description +
                '</p>' + 
                '<h2> <b> Project Lead: </b>'+ value.projectLead +'</h2>' +   
            '</div>'
            );
        }        
    });
    
    
    $(".project").click(function(e) {
        e.preventDefault();
        
        //This looks at the parent row of the cell being clicked on and gets the first child of that row which will always be the ID
        clickedProjectID = e.target.closest('div').id;
        //Now use the ID found above in where clause of a SQL query to return back more specific information about that PBI
        $.ajax({
        type: "POST",
        url: "../php/SetProject.php",
        data: {
            postedProjectID:clickedProjectID,
        },
        dataType: "json",
        success: function load(results){
            //console.log(results)
            window.location.href = '../dashboard.php';			 
        },
        error: function(xhr, status, error) {
            var err = eval("(" + xhr.responseText + ")");
            console.log(err.Message);
        }
        });

    });
    return false;
};
		