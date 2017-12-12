function postTables() {
  var weekDivs = $('.week-card')
  var lineup = $('#lineup-template')
  var scores = $('#scores-template')
  var standings = $('#standings-template')

  debugger

  for (card in weekDivs) {
    debugger
    weekDivs[card].innerHTML += lineup
    weekDivs[card].innerHTML += scores
    weekDivs[card].innerHTML += standings
  }
}
