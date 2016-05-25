/// <reference path="../js/jquery.d.ts"/>
/*================================================================================================================*/
/*================================================================================================================*/
// JavaScript to create the Chartist Pie Charts
/*================================================================================================================*/
/*================================================================================================================*/

//on document run an AJAX call to retrieve Graph data
$(document).ready(function() {
  $.ajax({
    dataType: "json",
    url: "./php/PieData.php",
    //if the ajax call is successful run the function createarray - 
    //this contains everything else in this JS file
    success: function success (result) {
            createPies(result);
            //console.log(result);
    }       
  });
});		
        
/*================================================================================================================*/
/*================================================================================================================*/
//This function gets called on the success callback of the AJAX call
/*================================================================================================================*/
/*================================================================================================================*/	  
	    // function createGraph(phpArray) {
            
        //     var xlab = [];
        //     var totalEffort = []; 
        //     var remainingEffort = [];
        //     var effortcommitted =[];
        //     var noOfSprints = 0;
            
        //     //Get each iteration name out of the JSON array
	    //     $.each(phpArray, function (key, value) {
		// 	    var label = value.itName;
        //         xlab.push(label); 
        //         noOfSprints++ ;               
	    //         });
        //         //console.log(xlab);
           
        //    //get each iteration effort total from the JSON array and check for nulls.
        //    //nulls will skew graph data 
        //    $.each(phpArray, function (key, value) {
        //        if (!value.effTot) {   
        //        }
        //        else{
        //            var tEff = value.effTot;
        //             totalEffort.push(tEff);
        //         }                   
	    //         });
        //         //console.log(totalEffort);
                
        //    //get each iteration effort remaining from the JSON array and check for nulls.
        //    //nulls will skew graph data     
        //    $.each(phpArray, function (key, value) {
        //        if (!value.effRem) {   
        //        }
        //        else{
    	// 		    var rEff = value.effRem;
        //             remainingEffort.push(rEff);
        //        }                
	    //        });
        //         //console.log(remainingEffort);
            
        //     //get each iteration effort done from the JSON array.
        //     $.each(phpArray, function (key, value) {
        //         var comeff = value.effCom;
        //         effortcommitted.push(comeff);                
	    //         });
        //          //console.log(effortcommitted);
        //          //console.log(noOfSprints);
/*================================================================================================================*/
/*================================================================================================================*/
//Create the left hand pie chart
/*================================================================================================================*/
/*================================================================================================================*/
//$(document).ready(function() {
function createPies(results){  
//   for (i=2;i<=3;i++){           
//     var chart = new Chartist.Pie('#pieContainer'+i, {
//         series: [3,6],
//         labels: [1,2]
//     }, 
//     {
//     donut: true,
//     donutWidth : 45,
//     showLabel: false
//     })
//   };
  
  var pie1Array = [];
  var pie2Array = [];
  var pie3Array = [];
  var pie1Data = [];
  var pie2Data = [];
  var pie3Data = [];
  
  $.each(results, function (key, value){
		//phpProjectValues = value[0];
		pie1Array = value[0];
		pie2Array = value[1];
		pie3Array = value[2];
	});
  
  $.each(pie1Array, function (key, value){
    pie1Data.push(parseInt(value.effDone));
    pie1Data.push(parseInt(value.effRem));
  })
  
  $.each(pie2Array, function (key, value){
    pie2Data.push(parseInt(value.projectHoursDone));
    pie2Data.push(parseInt(value.projectHoursRem));
  })
  
  $.each(pie3Array, function (key, value){
    pie3Data.push(parseInt(value.userHoursDone));
    pie3Data.push(parseInt(value.userHoursRem));
  })
  
  //console.log(pie1Array, pie2Array, pie3Array,pie1Data,pie2Data,pie3Data);
  
  //console.log(pie1);
  
  var chart = new Chartist.Pie('#pieContainer1', {
      series: pie1Data,
      labels: ["Effort Done", " "]
  }, 
  {
  donut: true,
  donutWidth : 45,
  showLabel: false,
  //labelOffset: -50,
  labelDirection: 'implode'
  });
  
  var chart2 = new Chartist.Pie('#pieContainer2', {
      series: pie2Data,
      labels: ["Hours Complete", " "]
  }, 
  {
  donut: true,
  donutWidth : 45,
  showLabel: false,
  //labelOffset: -50,
  labelDirection: 'implode'
  });
  
  var chart3 = new Chartist.Pie('#pieContainer3', {
      series: pie3Data,
      labels: ["Hours You've Completed", " "]
  }, 
  {
  donut: true,
  donutWidth : 45,
  showLabel: false,
  //labelOffset: -50,
  labelDirection: 'implode'
  });

  chart.on('draw', function(data) {
    if(data.type === 'slice') {
      // Get the total path length in order to use for dash array animation
      var pathLength = data.element._node.getTotalLength();
  
      // Set a dasharray that matches the path length as prerequisite to animate dashoffset
      data.element.attr({
        'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
      });
  
      // Create animation definition while also assigning an ID to the animation for later sync usage
      var animationDefinition = {
        'stroke-dashoffset': {
          id: 'anim' + data.index,
          dur: 1000,
          from: -pathLength + 'px',
          to:  '0px',
          easing: Chartist.Svg.Easing.easeOutQuint,
          // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
          fill: 'freeze'
      }
    };
  
      // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
      if(data.index !== 0) {
        animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
      }
  
      // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
      data.element.attr({
        'stroke-dashoffset': -pathLength + 'px'
      });
  
      // We can't use guided mode as the animations need to rely on setting begin manually
      // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
      data.element.animate(animationDefinition, false);
    }
  });
  
  chart2.on('draw', function(data) {
    if(data.type === 'slice') {
      // Get the total path length in order to use for dash array animation
      var pathLength = data.element._node.getTotalLength();
  
      // Set a dasharray that matches the path length as prerequisite to animate dashoffset
      data.element.attr({
        'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
      });
  
      // Create animation definition while also assigning an ID to the animation for later sync usage
      var animationDefinition = {
        'stroke-dashoffset': {
          id: 'anim' + data.index,
          dur: 1000,
          from: -pathLength + 'px',
          to:  '0px',
          easing: Chartist.Svg.Easing.easeOutQuint,
          // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
          fill: 'freeze'
      }
    };
  
      // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
      if(data.index !== 0) {
        animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
      }
  
      // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
      data.element.attr({
        'stroke-dashoffset': -pathLength + 'px'
      });
  
      // We can't use guided mode as the animations need to rely on setting begin manually
      // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
      data.element.animate(animationDefinition, false);
    }
  });
  
  chart3.on('draw', function(data) {
    if(data.type === 'slice') {
      // Get the total path length in order to use for dash array animation
      var pathLength = data.element._node.getTotalLength();
  
      // Set a dasharray that matches the path length as prerequisite to animate dashoffset
      data.element.attr({
        'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
      });
  
      // Create animation definition while also assigning an ID to the animation for later sync usage
      var animationDefinition = {
        'stroke-dashoffset': {
          id: 'anim' + data.index,
          dur: 1000,
          from: -pathLength + 'px',
          to:  '0px',
          easing: Chartist.Svg.Easing.easeOutQuint,
          // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
          fill: 'freeze'
      }
    };
  
      // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
      if(data.index !== 0) {
        animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
      }
  
      // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
      data.element.attr({
        'stroke-dashoffset': -pathLength + 'px'
      });
  
      // We can't use guided mode as the animations need to rely on setting begin manually
      // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
      data.element.animate(animationDefinition, false);
    }
  });
//   var pie1Width = ($('#pieContainer1').width() - 100)/2;
//   console.log(pie1Width);
//   $('#pieContainer1 h1').css({left: pie1Width + 'px'});
  //({ display: "block" });

};

//});

// $(document).ready(function() {
//   for (i=1;i<=3;i++){           
//   var chart = new Chartist.Pie('#pieContainer'+i, {
//   series: [75,25],
//   labels: [1, 2]
//   }, 
//   {
//   donut: true,
//   donutWidth : 45,
//   showLabel: false
//   });

//     chart.on('draw', function(data) {
//       if(data.type === 'slice') {
//         // Get the total path length in order to use for dash array animation
//         var pathLength = data.element._node.getTotalLength();
    
//         // Set a dasharray that matches the path length as prerequisite to animate dashoffset
//         data.element.attr({
//           'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
//         });
    
//         // Create animation definition while also assigning an ID to the animation for later sync usage
//         var animationDefinition = {
//           'stroke-dashoffset': {
//             id: 'anim' + data.index,
//             dur: 1000,
//             from: -pathLength + 'px',
//             to:  '0px',
//             easing: Chartist.Svg.Easing.easeOutQuint,
//             // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
//             fill: 'freeze'
//           }
//         };
    
//         // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
//         if(data.index !== 0) {
//           animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
//         }
    
//         // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us
//         data.element.attr({
//           'stroke-dashoffset': -pathLength + 'px'
//         });
    
//         // We can't use guided mode as the animations need to rely on setting begin manually
//         // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
//         data.element.animate(animationDefinition, false);
//       }
//     });
//   }
// });