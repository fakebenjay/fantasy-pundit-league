$('document').ready(function() {
  postHeadings()
  postLineup('matthew berry', 'good')
  postScores()
  postAnalysis()

  //Smooth scroll
  $("a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });

  $('td.team').click(function(e) {
    postLineup(e.target.innerText.toLowerCase(), e.target.nextSibling.className.split('-')[1])
  })

  $("[href='#standings']").click(function(e) {
    e.preventDefault
    if ($('#standings').children().length <= 5) {
      postStandings()
      // loadGraph()
    }
  })
})
