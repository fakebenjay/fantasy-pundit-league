function postScores() {
  var scoresTemplate = $('#scores-template').html()
  var templateFn = _.template(scoresTemplate)

  var weekDivs = $('.week-card')

  var templateHTML = templateFn({
    'berryGoodPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'eisenbergGoodPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'bellerGoodPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'rankGoodPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'fabianoGoodPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'iyerGoodPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'berryBadPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'eisenbergBadPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'bellerBadPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'rankBadPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'fabianoBadPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>",
    'iyerBadPoints': "<img src='loading.gif' alt='loading' width='12' height='12'>"
  })

  for (let i=1; i <= weekDivs.length; i++) {
    weekDivs[i-1].innerHTML += templateHTML
  }
}

function fillScores() {
  var pundits = ['matthew%20berry', 'jamey%20eisenberg', 'michael%20beller', 'adam%20rank', 'michael%20fabiano', 'vinnie%20iyer']
  var weekDivs = $('.week-card')
  
  for (let i=1; i <= weekDivs.length; i++) {
    for (let p=0; p<pundits.length; p++) {
      teamCall(pundits[p], i, 'good', function(json) {
        $(`#week-${i}`).find(`.${pundits[p].split('%20')[1]}-good`).html(json.team.total_points)
      })
      teamCall(pundits[p], i, 'bad', function(json) {
        $(`#week-${i}`).find(`.${pundits[p].split('%20')[1]}-bad`).html(json.team.total_points)
      })
    }
  }
}
