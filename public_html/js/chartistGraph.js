/// <reference path="jquery.d.ts"/>
        // on document run an AJAX call to retrieve Graph data
        $(document).ready(function() {
	        $.ajax({
	            dataType: "json",
	            url: "./php/GraphData.php",
                //if the ajax call is successful run the function createarray - 
                //this contains everything else in this JS file
				success: function createArray (result) {
                    createGraph(result);
                    //console.log(result);
				}            
	        });
	});		
	  
	    function createGraph(phpArray) {
            
            var xlab = [];
            var totalEffort = []; 
            var remainingEffort = [];
            var effortcommitted =[];
            
            //Get each iteration name out of the JSON array
	        $.each(phpArray, function (key, value) {
			    var label = value.itName;
                xlab.push(label);                
	            });
                //console.log(xlab);
           
           //get each iteration effort total from the JSON array and check for nulls.
           //nulls will skew graph data 
           $.each(phpArray, function (key, value) {
               if (!value.effTot) {   
               }
               else{
                   var tEff = value.effTot;
                    totalEffort.push(tEff);
                }                   
	            });
                //console.log(totalEffort);
                
           //get each iteration effort remaining from the JSON array and check for nulls.
           //nulls will skew graph data     
           $.each(phpArray, function (key, value) {
               if (!value.effRem) {   
               }
               else{
    			    var rEff = value.effRem;
                    remainingEffort.push(rEff);
               }                
	           });
                //console.log(remainingEffort);
            
            //get each iteration effort done from the JSON array.
            $.each(phpArray, function (key, value) {
                var comeff = value.effCom;
                effortcommitted.push(comeff);                
	            });
                 //console.log(effortcommitted);
                   
	        var data = {
	            // A labels array that can contain any sort of values
                labels: xlab,
	            // Our series' array that contains series objects or in this case series data arrays
	            series: [
                  totalEffort,
                  remainingEffort
	            ]
	        };

	        // As options we currently only set a static size of 300x200 px. We can also omit this and use aspect ratio containers
	        // as you saw in the previous example
	        var options = {
	            low: 0,
                axisY: {
                   onlyInteger: true,
                  }
	        };
            
            //options to use when with smaller screens    
	        var responsiveOptions = [
              ['screen and (min-width: 641px) and (max-width: 1024px)', {
                  showPoint: false,
                  axisX: {
                      labelInterpolationFnc: function (value) {
                          // Will return Mon, Tue, Wed etc. on medium screens
                          return value.slice(0, 3);
                      }
                  }
              }],
              ['screen and (max-width: 640px)', {
                  showPoint: false,
                  axisX: {
                      labelInterpolationFnc: function (value) {
                          // Will return M, T, W etc. on small screens
                          return value[0];
                      }
                  }
              }]
	        ];
            
            //create the burndown line graph
	        var chart = new Chartist.Line('#chart1', data, options, responsiveOptions);

	        var seq = 0,
            delays = 10,
            durations = 1500;

	        // Once the chart is fully created we reset the sequence
	        chart.on('created', function () {
	            seq = 0;
	        });

	        // On each drawn element by Chartist we use the Chartist.Svg API to trigger SMIL animations
	        chart.on('draw', function (data) {
	            seq++;

	            if (data.type === 'line') {
	                // If the drawn element is a line we do a simple opacity fade in. This could also be achieved using CSS3 animations.
	                data.element.animate({
	                    opacity: {
	                        // The delay when we like to start the animation
	                        begin: seq * delays + 1000,
	                        // Duration of the animation
	                        dur: durations,
	                        // The value where the animation should start
	                        from: 0,
	                        // The value where it should end
	                        to: 1
	                    }
	                });
	            } else if (data.type === 'label' && data.axis === 'x') {
	                data.element.animate({
	                    y: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.y + 100,
	                        to: data.y,
	                        // We can specify an easing function from Chartist.Svg.Easing
	                        easing: 'easeOutQuart'
	                    }
	                });
	            } else if (data.type === 'label' && data.axis === 'y') {
	                data.element.animate({
	                    x: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.x - 50,
	                        to: data.x,
	                        easing: 'easeOutQuart'
	                    }
	                });
	            } else if (data.type === 'point') {
	                data.element.animate({
	                    x1: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.x - 50,
	                        to: data.x,
	                        easing: 'easeOutQuart'
	                    },
	                    x2: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.x - 50,
	                        to: data.x,
	                        easing: 'easeOutQuart'
	                    },
	                    opacity: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: 0,
	                        to: 1,
	                        easing: 'easeOutQuart'
	                    }
	                });
	            } /*else if (data.type === 'grid') {
	                // Using data.axis we get x or y which we can use to construct our animation definition objects
	                var pos1Animation = {
	                    begin: seq * delays,
	                    dur: durations,
	                    from: data[data.axis.units.pos + '1'] - 30,
	                    to: data[data.axis.units.pos + '1'],
	                    easing: 'easeOutQuart'
	                };

	                var pos2Animation = {
	                    begin: seq * delays,
	                    dur: durations,
	                    from: data[data.axis.units.pos + '2'] - 100,
	                    to: data[data.axis.units.pos + '2'],
	                    easing: 'easeOutQuart'
	                };

	                var animations = {};
	               //animations[data.axis.units.pos + '1'] = pos1Animation;
	               // animations[data.axis.units.pos + '2'] = pos2Animation;
	                animations['opacity'] = {
	                    begin: seq * delays,
	                    dur: durations,
	                    from: 0,
	                    to: 1,
	                    easing: 'easeOutQuart'
	                };

	                data.element.animate(animations);
	            }*/
                //fades in graph lines
                /*else if (data.type === 'grid') {
	                var animations = {};
	                animations['opacity'] = {
	                    begin: seq * delays,
	                    dur: durations,
	                    from: 0,
	                    to: 1,
	                    easing: 'easeOutQuart'
	                };
	                data.element.animate(animations);
	            }*/
	        });
            /*
            var $chart = $('.ct-chart');
            
            var $toolTip = $chart
              .append('<div class="tooltip"></div>')
              .find('.tooltip')
              .hide();
            
            $chart.on('mouseenter', '.ct-point', function() {
              var $point = $(this),
                value = $point.attr('ct:value'),
                seriesName = $point.parent().attr('ct:series-name');
              $toolTip.html(seriesName + '<br>' + value).show();
            });
            
            $chart.on('mouseleave', '.ct-point', function() {
              $toolTip.hide();
            });
            
            $chart.on('mousemove', function(event) {
              $toolTip.css({
                left: (event.offsetX || event.originalEvent.layerX) - $toolTip.width() / 2 - 10,
                top: (event.offsetY || event.originalEvent.layerY) - $toolTip.height() - 40
              });
            });*/
            
            //create the bar chart for effort done per sprint
            var barchart = new Chartist.Bar('#chart2', {
              labels: xlab,
              series: [effortcommitted]
            },options, responsiveOptions);

	        // Once the chart is fully created we reset the sequence
	        barchart.on('created', function () {
	            seq = 0;
	        });

	        // On each drawn element by Chartist we use the Chartist.Svg API to trigger SMIL animations
	        barchart.on('draw', function (data) {
	            seq++;

	            if (data.type === 'bar') {
	                // If the drawn element is a bar we do a simple opacity fade in. This could also be achieved using CSS3 animations.
	                data.element.animate({
	                    opacity: {
	                        // The delay when we like to start the animation
	                        begin: seq * delays,
	                        // Duration of the animation
	                        dur: 1000,
	                        // The value where the animation should start
	                        from: 0,
	                        // The value where it should end
	                        to: 1
	                    },
                        /*y1: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.y -10,
	                        to: data.y,
	                        easing: 'easeOutQuart'
	                    }*/
	                });
	            }
                });
	    };