$('document').ready(function() {
  postHeadings()
  postLineup('matthew berry', 'good')
  postScores()
  postAnalysis()
  smoothScroll()

  $('td.team').click(function(e) {
    postLineup(e.target.innerText.toLowerCase(), e.target.nextSibling.className.split('-')[1])
  })

  $("[href='#standings']").click(function(e) {
    e.preventDefault
    if ($('#standings').children().length <= 5) {
      postStandings()
      smoothScroll()
      // loadGraph()
    }
  })
})
