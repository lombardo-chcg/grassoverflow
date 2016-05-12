$(document).ready(function() {
// add new answer to bottom of answer-container
  $(".new-answer-form").on('submit', 'form', function(event) {
    event.preventDefault();
    var formContent = $(this).find('input').serialize()
    var requestRoute = $(this).attr('action');
    var request = $.ajax({
      method: 'post',
      url: requestRoute,
      data: formContent
    });
    request.done(function(response){
      $(".answer-container").append(response);
    });
    // request fail
  });

// add comment to answer
  $(".answer-container").on("submit", "form", function(event) {
    event.preventDefault();
    var localThis = $(this)
    var comment = $(this).find('input').serialize();
    var requestRoute = $(this).attr('action');

    var request = $.ajax({
      method: "POST",
      url: requestRoute,
      data: comment
    });
    request.done(function(response) {
         localThis.closest('.answer-post').find('ul').append(response)
      // $(".answer-container ul").append(response);
      // this is appending to the wqhole container. we need it to
      // append to the answer in question
    });
  });

// add comment to question
  $(".new-comment-form").on("submit", "form", function(event){
    event.preventDefault();
    var comment = $(this).find('input').serialize();
    var requestRoute = $(this).attr('action');

    var request = $.ajax({
      method: "post",
      url: requestRoute,
      data: comment
    });
    request.done(function(response){
      $(".question-comment-container").append(response);
    });
  });


});
