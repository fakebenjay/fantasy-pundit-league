$("document").ready(function(){
  $.ajax({url: "http://localhost:3000/quarterbacks/carson%20wentz/5", success: function(result){
    console.log(result)
  }});
});
