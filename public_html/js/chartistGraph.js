/// <reference path="jquery.d.ts"/>
   
        $(document).ready(function() {
	        $.ajax({
	            dataType: "json",
	            url: "./php/GraphData.php",
				success: function createArray (result) {
                    createGraph(result);
				}            
	        });
	});		
	  
	    function createGraph(phpArray) {
            
            var xlab = [];
            var totalEffort = []; 
            
	        $.each(phpArray, function (key, value) {
			    var label = value.itName;
                xlab.push(label);                
	            });
                //console.log(xlab);
            
           $.each(phpArray, function (key, value) {
			    var tEff = value.effTot;
                totalEffort.push(tEff);                
	            });
                console.log(totalEffort);
                
	        var data = {
	            // A labels array that can contain any sort of values
	            //labels: ['Sprint 1', 'Sprint 2', 'Sprint 3', 'Sprint 4', 'Sprint 5'],
                labels: xlab,
	            // Our series array that contains series objects or in this case series data arrays
	            series: [
                  //[10, 10, 13, 13, 18],
                  totalEffort,
                  [5, 2, 4, 2, 0]
	            ]
	        };

	        // As options we currently only set a static size of 300x200 px. We can also omit this and use aspect ratio containers
	        // as you saw in the previous example
	        var options = {
	            low: 0
	        };

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

	        var chart = new Chartist.Line('.ct-chart', data, options, responsiveOptions);

	        var seq = 0,
          delays = 80,
          durations = 500;

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
	                        from: data.x - 100,
	                        to: data.x,
	                        easing: 'easeOutQuart'
	                    }
	                });
	            } else if (data.type === 'point') {
	                data.element.animate({
	                    x1: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.x - 10,
	                        to: data.x,
	                        easing: 'easeOutQuart'
	                    },
	                    x2: {
	                        begin: seq * delays,
	                        dur: durations,
	                        from: data.x - 10,
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
	            } else if (data.type === 'grid') {
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
	                animations[data.axis.units.pos + '1'] = pos1Animation;
	                animations[data.axis.units.pos + '2'] = pos2Animation;
	                animations['opacity'] = {
	                    begin: seq * delays,
	                    dur: durations,
	                    from: 0,
	                    to: 1,
	                    easing: 'easeOutQuart'
	                };

	                data.element.animate(animations);
	            }
	        });

	        // For the sake of the example we update the chart every time it's created with a delay of 10 seconds
	        //chart.on('created', function() {
	        //  if(window.__exampleAnimateTimeout) {
	        //    clearTimeout(window.__exampleAnimateTimeout);
	        //    window.__exampleAnimateTimeout = null;
	        //  }
	        //  window.__exampleAnimateTimeout = setTimeout(chart.update.bind(chart), 12000);
	        //});
	    };