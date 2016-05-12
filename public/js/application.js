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

$(".answer-container").on("submit",".upvote-answer-button", function(event){
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


  $(".answer-container").on("submit",".downvote-answer-button",function(event){
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

$(".answer-container").on("submit",".answer-comment-upvote-button",function(event){
    event.preventDefault();
    var count = $(this).closest('.answer-comment-post').find('.answer-comment-vote-count');
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


  $(".answer-container").on("submit",".answer-comment-downvote-button",function(event){
    event.preventDefault();
    var count = $(this).closest('.answer-comment-post').find('.answer-comment-vote-count');
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


$(".question-comment-container").on("submit",".comment-upvote-button", function(event){
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


  $(".question-comment-container").on("submit",".comment-downvote-button", function(event){
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

  $(".index-container").on("submit", ".upvote", function(event){
      event.preventDefault();
      var count = $(this).closest('article').find('.count-votes')
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


    $(".index-container").on("submit",".downvote", function(event){
      event.preventDefault();
      var count = $(this).closest('article').find('.count-votes')
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


    $(".sharpest-blade").on("submit", function(event){
      event.preventDefault();

    });

});
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
