//pie chart 1

$(document).ready(function() {
    var ctx = $("#chart-line");
    var myLineChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["Spring", "Summer", "Fall", "Winter"],
            datasets: [{
                data: [1200, 1700, 800, 200],
                backgroundColor: ["rgba(255, 0, 0, 0.5)", "rgba(100, 255, 0, 0.5)", "rgba(200, 50, 255, 0.5)", "rgba(0, 100, 255, 0.5)"]
            }]
        },
        options: {
            title: {
                display: true,
                text: 'Weather'
            }
        }
    });
});


// pie chart 2
$(document).ready(function(){

	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	var data = google.visualization.arrayToDataTable([
	['Task', 'Hours per Day'],
	['Work', 11],
	['Eat', 2],
	['Commute', 2],
	['Watch TV', 2],
	['Sleep', 7]
	]);
	
	var options = {
	title: 'My Daily Activities',
	pieHole: 0.4,
	};
	
	var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	chart.draw(data, options);
	}
	
	});




    // pie chart 3
    $(document).ready(function() {
        var ctx = $("#chart-line1");
        var myLineChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
                datasets: [{
                    data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478],
                    label: "Africa",
                    borderColor: "#458af7",
                    backgroundColor: '#458af7',
                    fill: false
                }, {
                    data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267],
                    label: "Asia",
                    borderColor: "#8e5ea2",
                    fill: true,
                    backgroundColor: '#8e5ea2'
                }, {
                    data: [168, 170, 178, 190, 203, 276, 408, 547, 675, 734],
                    label: "Europe",
                    borderColor: "#3cba9f",
                    fill: false,
                    backgroundColor: '#3cba9f'
                }]
            },
            options: {
                title: {
                    display: true,
                    text: 'World population per region (in millions)'
                }
            }
        });
    });




    // pie chart 4
    $(document).ready(function() { // Create a simple bi-polar bar chart
        var chart = new Chartist.Bar('.ct-chart', {
            labels: ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7', 'W8', 'W9', 'W10'],
            series: [
                [1, 2, 4, 8, 6, -2, -1, -4, -6, -2]
            ]
        }, {
            high: 10,
            low: -10,
            axisX: {
                labelInterpolationFnc: function(value, index) {
                    return index % 2 === 0 ? value : null;
                }
            }
        });
        // Listen for draw events on the bar chart
        chart.on('draw', function(data) { // If this draw event is of type bar we can use the data to create additional content if(data.type === 'bar') { // We use the group element of the current series to append a simple circle with the bar peek coordinates and a circle radius that is depending on the value data.group.append(new Chartist.Svg('circle', { cx: data.x2, cy: data.y2, r: Math.abs(Chartist.getMultiValue(data.value)) * 2 + 5 }, 'ct-slice-pie')); }
        });
    });


    