$('document').ready(function() {
  postHeadings()
  postGraf()
  postLineup('matthew berry', 'good')
  postScores()
  postAnalysis()
  smoothScroll()
  postStandings()
  fillScores()

  $('td.team').click(function(e) {
    postLineup(e.target.innerText.toLowerCase(), e.target.nextSibling.className.split('-')[1])
  })

  $("[href='#standings']").click(function(e) {
    e.preventDefault
    if ($('#standings').children().length <= 6) {
      fillStandings()
      loadGraph()
    }
  })
})
