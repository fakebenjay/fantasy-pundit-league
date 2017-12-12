function postTables() {
  var weekDivs = $('.week-card')
  var lineup = $('#lineup-template')
  var scores = $('#scores-template')
  var standings = $('#standings-template')

  for (card in weekDivs) {
    weekDivs[card].innerHTML += lineup
    weekDivs[card].innerHTML += scores
    weekDivs[card].innerHTML += standings
  }
}
