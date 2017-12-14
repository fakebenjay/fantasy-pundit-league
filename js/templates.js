function postHeadings() {
  var headingsTemplate = $('#headings-template').html()
  var templateFn = _.template(headingsTemplate)

  var headlineHTML = templateFn({'heading': "Fantasy Pundit Football League (FPFL)"})
  var standingsHTML = templateFn({'heading': "Standings"})

  var weekDivs = $('.week-card')

  $('#title').html(headlineHTML)
  $('#standings').html(standingsHTML)

  for (let i=0; i<weekDivs.length; i++) {
    weekDivs[i].innerHTML += templateFn({'heading': weekDivs[i].id.replace('-', ' ').replace('w', 'W')})
  }
}

function postLineup(pundit, quality) {
  var lineupTemplate = $('#lineup-template').html()
  var templateFn = _.template(lineupTemplate)

  var weekDivs = $('.week-card')

  var templateHTML = templateFn({
    'pundit': '',
    'qbName': '',
    'qbPoints': '',
    'rb1Name': '',
    'rb1Points': '',
    'rb2Name': '',
    'rb2Points': '',
    'wr1Name': '',
    'wr1Points': '',
    'wr2Name': '',
    'wr2Points': '',
    'teName': '',
    'tePoints': '',
    'flexName': '',
    'flexPoints': '',
    'dstName': '',
    'dstPoints': '',
    'kName': '',
    'kPoints': '',
    'totalPoints': ''
  })

  for (let i=1; i <= weekDivs.length; i++) {
    if (weekDivs[i-1].children.length <= 5) {
      weekDivs[i-1].innerHTML += templateHTML
    }

    teamCall(pundit, i, quality, function(json) {
      $(`#week-${i}`).find('.team-name').html(`${json.team.name}'s ${quality} team`)
      $(`#week-${i}`).find('.qb-name').html(json.team.qb_name)
      $(`#week-${i}`).find('.qb-points').html(json.team.qb_points)
      $(`#week-${i}`).find('.rb1-name').html(json.team.rb1_name)
      $(`#week-${i}`).find('.rb1-points').html(json.team.rb1_points)
      $(`#week-${i}`).find('.rb2-name').html(json.team.rb2_name)
      $(`#week-${i}`).find('.rb2-points').html(json.team.rb2_points)
      $(`#week-${i}`).find('.wr1-name').html(json.team.wr1_name)
      $(`#week-${i}`).find('.wr1-points').html(json.team.wr1_points)
      $(`#week-${i}`).find('.wr2-name').html(json.team.wr2_name)
      $(`#week-${i}`).find('.wr2-points').html(json.team.wr2_points)
      $(`#week-${i}`).find('.te-name').html(json.team.te_name)
      $(`#week-${i}`).find('.te-points').html(json.team.te_points)
      $(`#week-${i}`).find('.flex-name').html(json.team.flex_name)
      $(`#week-${i}`).find('.flex-points').html(json.team.flex_points)
      $(`#week-${i}`).find('.dst-name').html(json.team.dst_name)
      $(`#week-${i}`).find('.dst-points').html(json.team.dst_points)
      $(`#week-${i}`).find('.k-name').html(json.team.k_name)
      $(`#week-${i}`).find('.k-points').html(json.team.k_points)
      $(`#week-${i}`).find('.total-points').html(json.team.total_points)
    })
  }
}

function postScores() {
  var scoresTemplate = $('#scores-template').html()
  var templateFn = _.template(scoresTemplate)

  var weekDivs = $('.week-card')

  var templateHTML = templateFn({
    'berryGoodPoints': '',
    'eisenbergGoodPoints': '',
    'bellerGoodPoints': '',
    'rankGoodPoints': '',
    'fabianoGoodPoints': '',
    'iyerGoodPoints': '',
    'berryBadPoints': '',
    'eisenbergBadPoints': '',
    'bellerBadPoints': '',
    'rankBadPoints': '',
    'fabianoBadPoints': '',
    'iyerBadPoints': ''
  })

  for (let i=1; i <= weekDivs.length; i++) {
    weekDivs[i-1].innerHTML += templateHTML

    var pundits = ['matthew%20berry', 'jamey%20eisenberg', 'michael%20beller', 'adam%20rank', 'michael%20fabiano', 'vinnie%20iyer']

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

function postAnalysis() {
  var analysisTemplate = $('#analysis-template').html()
  var templateFn = _.template(analysisTemplate)

  var weekDivs = $('.week-card')
  var templateHTML = templateFn({'content': "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar,"})

  for (let i=0; i<weekDivs.length; i++) {
    weekDivs[i].innerHTML += templateHTML
  }
}



// for (let i=1; i <= weekDivs.length; i++) {
//   tally = 0
//   for (let p=0; p<punditClasses.length; p++) {
//     // standingObj[weekDivs.find(punditClasses[p]).slice(0, i)[0].previousSibling.innerText] = weekDivs.find(punditClasses[p]).slice(0, i).innerText
//     tally += parseFloat($(punditClasses[p]).slice(0, i)[0].innerText)
//     debugger
//   }
//   weekDivs[i-1].innerHTML += templateHTML
// }
