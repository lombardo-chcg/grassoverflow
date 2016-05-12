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

  $(".answer-comment-form").on("submit", "form", function(event) {
    event.preventDefault();

    var comment = $(this).find('input').serialize();
    var requestRoute = $(this).attr('action');

    var request = $.ajax({
      method: "POST",
      url: requestRoute,
      data: comment
    });
    request.done(function(response) {
      $(".answer-content").append(response);
      comment.val('')
    });
  });



});
