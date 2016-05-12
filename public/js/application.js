$(document).ready(function() {

  $(".question-upvote-button").on("submit", function(event){
    event.preventDefault();
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "upvote"

    });

      $request.done(function(vote_count){
        $('.question-votecount').text(vote_count);
      });
  });


  $(".question-downvote-button").on("submit", function(event){
    event.preventDefault();
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "downvote"
    });

      $request.done(function(vote_count){
        $('.question-votecount').text(vote_count);
      });

  });

$(".upvote-answer-button").on("submit", function(event){
    event.preventDefault();
    var count = $(this).closest('.answer-post').find('.answer-vote-count')
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "upvote"

    });

      $request.done(function(vote_count){
        count.text(vote_count);
      });
  });


  $(".downvote-answer-button").on("submit", function(event){
    event.preventDefault();
    var count = $(this).closest('.answer-post').find('.answer-vote-count')
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "downvote"
    });

      $request.done(function(vote_count){
        count.text(vote_count);
      });

  });

$(".answer-comment-upvote-button").on("submit", function(event){
    event.preventDefault();
    var count = $(this).closest('div').find('.answer-comment-vote-count')
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "upvote"

    });

      $request.done(function(vote_count){
        count.text(vote_count);
      });
  });


  $(".answer-comment-downvote-button").on("submit", function(event){
    event.preventDefault();
    var count = $(this).closest('div').find('.answer-comment-vote-count')
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "downvote"
    });

      $request.done(function(vote_count){
        count.text(vote_count);
      });
  });


$(".comment-upvote-button").on("submit", function(event){
    event.preventDefault();
    var count = $(this).closest('div').find('.comment-vote-count')
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "upvote"

    });

      $request.done(function(vote_count){
        count.text(vote_count);
      });
  });


  $(".comment-downvote-button").on("submit", function(event){
    event.preventDefault();
    var count = $(this).closest('div').find('.comment-vote-count')
    var route = $(this).attr("action");
    var $request = $.ajax({
      method: "POST",
      url: route,
      data: "downvote"
    });

      $request.done(function(vote_count){
        count.text(vote_count);
      });
  });

});
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
