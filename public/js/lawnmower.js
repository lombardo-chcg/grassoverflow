$(document).ready(function(){
  $("#lawnmower").hide();
  $("#login-form").on("submit", function(){

    $("#lawnmower").show().animate({left: 600}, 1000);

  }); 
});
