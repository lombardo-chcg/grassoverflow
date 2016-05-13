$(document).ready(function() {
// add new answer to bottom of answer-container
  $(".new-answer-form").on('submit', 'form', function(event) {
    event.preventDefault();
    var $this = $(this)
    var formContent = $(this).find('input').serialize()
    var requestRoute = $(this).attr('action');
    var request = $.ajax({
      method: 'post',
      url: requestRoute,
      data: formContent
    });
    request.done(function(response){
      $this.find('input:text').val('')
      $(".answer-container").append(response);
    });
    request.fail(function(){
        alert("Get off the lawn!  Or, login to perform this action.");
        window.location.href = "http://localhost:9393/login";
      });
    // request fail
  });

// add comment to answer
  $(".answer-container").on("submit", ".answer-comment-form form", function(event) {
    event.preventDefault();
    var $answerForm = $(this)
    var comment = $answerForm.find('input').serialize();
    var requestRoute = $answerForm.attr('action');

    var request = $.ajax({
      method: "POST",
      url: requestRoute,
      data: comment
    });
    request.done(function(response) {
        $answerForm.find('input:text').val('')
         $answerForm.closest('.answer-post').find('ul').append(response)
      // $(".answer-container ul").append(response);
      // this is appending to the wqhole container. we need it to
      // append to the answer in question
    });
    request.fail(function(){
        alert("Get off the lawn!  Or, login to perform this action.");
        window.location.href = "http://localhost:9393/login";
      });
  });

// add comment to question
  $(".new-comment-form").on("submit", "form", function(event){
    event.preventDefault();
    var $this = $(this)
    var comment = $(this).find('input').serialize();
    var requestRoute = $(this).attr('action');

    var request = $.ajax({
      method: "post",
      url: requestRoute,
      data: comment
    });
    request.done(function(response){
      $this.find('input:text').val('')
      $(".question-comment-container ul").append(response);
    });
    request.fail(function(){
        alert("Get off the lawn!  Or, login to perform this action.");
        window.location.href = "http://localhost:9393/login";
      });
  });


});
