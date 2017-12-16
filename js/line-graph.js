var margin = {top: 20, right: 20, bottom: 30, left: 50},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

// parse the date / time
var parseTime = d3.timeParse("%Y");

// set the ranges
var x = d3.scaleLinear().range([0, width]);
var y = d3.scaleLinear().range([height, 0]);

// define the line
var valueline = d3.line()
  .x(function(d) { return x(d.Date); })
  .y(function(d) { return y(d.Imports); });
// define the line
var valueline2 = d3.line()
  .x(function(d) { return x(d.Date); })
  .y(function(d) { return y(d.Exports); });

// append the svg obgect to the body of the page
// appends a 'group' element to 'svg'
// moves the 'group' element to the top left margin
var svg = d3.select("body").append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
.append("g")
  .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

function draw(data) {
  // Scale the range of the data
  x.domain(d3.extent(data, function(d) { return d.Date; }));
  y.domain([0, d3.max(data, function(d) {
	  return Math.max(d.Imports, d.Exports); })]);

  // Add the valueline path.
  svg.append("path")
      .data([data])
      .attr("class", "line")
      .attr("d", valueline);
  // Add the valueline path.
  svg.append("path")
      .data([data])
      .attr("class", "line")
      .attr("d", valueline2);
  // Add the X Axis
  svg.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  // Add the Y Axis
  svg.append("g")
      .call(d3.axisLeft(y));
  }
// Get the data
d3.json("data.json", function(error, data) {
  if (error) throw error;

  // trigger render
  draw(data, "Afghanistan");
});

// function loadGraph() {
//   var w = 800;
// 	var h = 300;
// 	var padding = 40;
//
//   var dataset = function() {
//     var goodTeam = $('.good-teams')
//     array = []
//
//     for (let i=0; i<goodTeam.length; i++) {
//       array.push({
//         'week': i+1,
//         'Matthew Berry': parseFloat($('.good-teams')[i].getElementsByClassName('points')[0].innerText),
//         'Jamey Eisenberg': parseFloat($('.good-teams')[i].getElementsByClassName('points')[1].innerText),
//         'Michael Beller': parseFloat($('.good-teams')[i].getElementsByClassName('points')[2].innerText),
//         'Adam Rank': parseFloat($('.good-teams')[i].getElementsByClassName('points')[3].innerText),
//         'Michael Fabiano': parseFloat($('.good-teams')[i].getElementsByClassName('points')[4].innerText),
//         'Vinnie Iyer': parseFloat($('.good-teams')[i].getElementsByClassName('points')[5].innerText)
//       })
//     }
//     // sort weeks ascending
//     array.sort(function(a, b){
//       return a["week"]-b["week"];
//     })
//     return array
//   }()
//
//   var xScale, yScale, xAxis, yAxis, valueline1, valueline2, valueline3, valueline4, valueline5, valueline6;  //Empty, for now
//
//   //Print data to console as table, for verification
//   //console.table(dataset, ["date", "average"]);
//   //Create scale functions
//   xScale = d3.scaleLinear()
//   			   .domain([1, 17])
//   			   .range([padding, w]);
//   yScale = d3.scaleLinear()
//   				.domain([
//   					d3.min(dataset, function(d) { return Math.min(d['Matthew Berry'], d['Jamey Eisenberg'], d['Michael Beller'], d['Adam Rank'], d['Michael Fabiano'], d['Vinnie Iyer']) - 10 }),
//   					d3.max(dataset, function(d) { return Math.min(d['Matthew Berry'], d['Jamey Eisenberg'], d['Michael Beller'], d['Adam Rank'], d['Michael Fabiano'], d['Vinnie Iyer']) + 10 })
//   				])
//   				.range([h - padding, 0]);
//   //Define axes
//   xAxis = d3.axisBottom()
//   		   .scale(xScale)
//   		   .ticks(17)
//   //Define Y axis
//   yAxis = d3.axisLeft()
//   		   .scale(yScale)
//   		   .ticks(10);
//   //Define line generators
//   valueline1 = d3.line()
//     .x(function(d) { return xScale(d.week); })
//     .y(function(d) { return yScale(d['Matthew Berry']); });
//   // define the line
//   valueline2 = d3.line()
//     .x(function(d) { return xScale(d.week); })
//     .y(function(d) { return yScale(d['Jamey Eisenberg']); });
//   // define the line
//   valueline3 = d3.line()
//     .x(function(d) { return xScale(d.week); })
//     .y(function(d) { return yScale(d['Michael Beller']); });
//   // define the line
//   valueline4 = d3.line()
//     .x(function(d) { return xScale(d.week); })
//     .y(function(d) { return yScale(d['Adam Rank']); });
//   // define the line
//   valueline5 = d3.line()
//     .x(function(d) { return xScale(d.week); })
//     .y(function(d) { return yScale(d['Michael Fabiano']); });
//   // define the line
//   valueline6 = d3.line()
//     .x(function(d) { return xScale(d.week); })
//     .y(function(d) { return yScale(d['Vinnie Iyer']); });
//
//   //Create SVG element
//   var svg = d3.select("body")
//   			.append("svg")
//   			.attr("width", w)
//   			.attr("height", h);
//   //Create lines
//   svg.append("path")
//   	.datum(dataset)
//   	.attr("class", "line1")
//   	.attr("d", valueline1);
//   svg.append("path")
//   	.datum(dataset)
//   	.attr("class", "line2")
//   	.attr("d", valueline2);
//   svg.append("path")
//   	.datum(dataset)
//   	.attr("class", "line3")
//   	.attr("d", valueline3);
//   svg.append("path")
//   	.datum(dataset)
//   	.attr("class", "line4")
//   	.attr("d", valueline4);
//   svg.append("path")
//   	.datum(dataset)
//   	.attr("class", "line5")
//   	.attr("d", valueline5);
//   svg.append("path")
//   	.datum(dataset)
//   	.attr("class", "line6")
//   	.attr("d", valueline6);
//   //Create axes
//   svg.append("g")
//   	.attr("class", "axis")
//   	.attr("transform", "translate(0," + (h - padding) + ")")
//   	.call(xAxis);
//   svg.append("g")
//   	.attr("class", "axis")
//   	.attr("transform", "translate(" + padding + ",0)")
//   	.call(yAxis);
//   // //Draw 350 ppm line
//   // svg.append("line")
//   // 	.attr("class", "line safeLevel")
//   // 	.attr("x1", padding)
//   // 	.attr("x2", w)
//   // 	.attr("y1", yScale(350))
//   // 	.attr("y2", yScale(350));
//   // //Label 350 ppm line
//   // svg.append("text")
//   // 	.attr("class", "dangerLabel")
//   // 	.attr("x", padding + 20)
//   // 	.attr("y", yScale(350) - 7)
//   // 	.text("350 ppm “safe” level");
// }
