/// <reference path="../js/jquery.d.ts"/>
/*================================================================================================================*/
/*================================================================================================================*/
// JavaScript to create the Chartist Pie Charts
/*================================================================================================================*/
/*================================================================================================================*/

//on document run an AJAX call to retrieve pie chart data
$(document).ready(function() {
  $.ajax({
    dataType: "json",
    url: "./php/PieData.php",
    //if the ajax call is successful run the function createarray - 
    //this contains everything else in this JS file
    success: function success (result) {
            createPies(result);
    },
  });
});		
        
/*================================================================================================================*/
/*================================================================================================================*/
//Create the left hand pie chart
/*================================================================================================================*/
/*================================================================================================================*/

function createPies(results){  
  
  //Set up variables
  var pie1Array = [];
  var pie2Array = [];
  var pie3Array = [];
  var pie1Data = [];
  var pie2Data = [];
  var pie3Data = [];
  
  //Process each of the arrays inside the array of results into an array variable of their own
  $.each(results, function (key, value){
		pie1Array = value[0];
		pie2Array = value[1];
		pie3Array = value[2];
	})
  
  //Process each of the individual arrays and prepare the data for the pie charts
  $.each(pie1Array, function (key, value){
    pie1Data.push(parseInt(value.effDone));
    pie1Data.push(parseInt(value.effRem));
    //add the percentage done to H1 in the centre of the pie chart
    $("#pieContainer1 h1").append('<br>'+ parseInt(value.effDone) + '%');
  })
  
  $.each(pie2Array, function (key, value){
    pie2Data.push(parseInt(value.projectHoursDone));
    pie2Data.push(parseInt(value.projectHoursRem));
    //add the percentage done to H1 in the centre of the pie chart
    $("#pieContainer2 h1").append('<br>'+ parseInt(value.projectHoursDone) + '%');
  })
  
  $.each(pie3Array, function (key, value){
    pie3Data.push(parseInt(value.userHoursDone));
    pie3Data.push(parseInt(value.userHoursRem));
    //add the percentage done to H1 in the centre of the pie chart
    $("#pieContainer3 h1").append('<br>'+ parseInt(value.userHoursDone) + '%');
  })
  
  var chart = new Chartist.Pie('#pieContainer1', {
      series: pie1Data,
      labels: ["Effort Done", " "]
  }, 
  {
  donut: true,
  donutWidth : 45,
  showLabel: false,
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

};
