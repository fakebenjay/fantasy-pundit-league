function lineupVars() {
  var vars = {}
  var counter = 1
  var rawLineups = [lineupWeek1, lineupWeek2, lineupWeek3, lineupWeek4, lineupWeek5, lineupWeek6, lineupWeek7, lineupWeek8, lineupWeek9, lineupWeek10, lineupWeek11, lineupWeek12, lineupWeek13, lineupWeek14]

  for (week in rawLineups) {
    for (pundit in rawLineups[week]) {
      debugger
      vars[`week-${counter}`][pundit]['good'] = rawLineups[week][pundit][Object.keys(rawLineups[week][pundit])[0]].good
      vars[`week-${counter}`][pundit]['bad'] = rawLineups[week][pundit][Object.keys(rawLineups[week][pundit])[0]].bad
    }
    counter++
  }
  console.log('done!')
  // rawLineups.forEach(function(week) {
  //   week.forEach(function(pundit) {
  //     debugger
  //   })
  // })
}

// var vars = {};
// var newCount = parseInt($('#hello').html(), 10);
//
// $('.hello').click(function(){
//     newCount++;
//     vars['hello' + newCount] = '<p>Hello World</p>';
// });
//
// alert( vars['hello1'] );
