function postStandings() {
  var standingsTemplate = $('#standings-template').html()
  var templateFn = _.template(standingsTemplate)

  var standingsChart = templateFn({
    'name1': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'avgPoints1': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'totPoints1': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'name2': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'avgPoints2': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'totPoints2': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'name3': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'avgPoints3': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'totPoints3': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'name4': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'avgPoints4': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'totPoints4': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'name5': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'avgPoints5': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'totPoints5': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'name6': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'avgPoints6': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'totPoints6': "<img src='loading.gif' alt='loading' width='12' height='12'>",
  })

  document.getElementById('standings').innerHTML += standingsChart
}

function fillStandings() {
  var weekDivs = $('.week-card')
  var punditClasses = ['.berry-good', '.eisenberg-good', '.beller-good', '.rank-good', '.fabiano-good', '.iyer-good']
  var array = []
  var teamList = $('tr.team')

  for (let p=0; p<punditClasses.length; p++) {
    var tally = 0
    var punditName = $(punditClasses[p])[0].previousSibling.innerText
    for (let w=0; w<weekDivs.length; w++) {
      tally += parseFloat($(punditClasses[p])[w].innerText)
    }
    array.push({[punditName]: Math.round10(tally, -1)})
  }

  array.sort(function(a, b) {
    return b[Object.keys(b)[0]] - a[Object.keys(a)[0]]
  })

  for (let i=0; i<teamList.length; i++) {
    teamList[i].children[0].innerText = Object.keys(array[i])[0]
    teamList[i].children[1].innerText = Math.round10(array[i][Object.keys(array[i])]/weekDivs.length, -1)
    teamList[i].children[2].innerText = array[i][Object.keys(array[i])]
  }
}
