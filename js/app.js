$('document').ready(function() {
  Object.keys(lineupWeek1).forEach((pundit) => {
    debugger
  })
  postTables()
})

// $('.matchup .team').click(function(e) {
//   e.preventDefault
//   $('.team-name').text(this.innerText)
// })

// if ($('#week-1').visible( true )) {
//   lineupJSON.forEach((t) => {
//       name: t.name,
//       week: "week-1",
//       qbName: t.week1.good.qb,
//       qbScore: get('quarterbacks', t.week1.good.qb, 1).quarterback.points,
//       rb1Name: t.week1.good.rb1,
//       rb1Score: get('runningbacks', t.week1.good.rb1, 1).runningback.points,
//       rb2Name: t.week1.good.rb2,
//       rb1Score: get('runningbacks', t.week1.good.rb2, 1).runningback.points,
//       wr1Name: t.week1.good.wr1,
//       wr1Score: get('widereceivers', t.week1.good.wr1, 1).widereceiver.points,
//       wr2Name: t.week1.good.wr2,
//       wr1Score: get('widereceivers', t.week1.good.wr2, 1).widereceiver.points,
//       teName: t.week1.good.te,
//       teScore: get('tightends', t.week1.good.te, 1).tightend.points,
//       flexName: t.week1.good.flex,
//       flexScore: get('flexes', t.week1.good.flex, 1).flex.points,
//       dstName: t.week1.good.dst,
//       dstScore: get('defenses', t.week1.good.dst, 1).defense.points,
//       kName: t.week1.good.k,
//       kScore: get('kickers', t.week1.good.k, 1).kicker.points,
//   })
// }
