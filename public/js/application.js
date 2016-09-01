// Answer-based AJAX
$(document).ready(function () {
  $('#answer-form').submit(function(event){
    event.preventDefault();
    var input = $(this).serialize();
    $.ajax({
      method: 'post',
      url: '/answers',
      data: input
    }).done(function(response){
      $('#answer-post').append(response)
    }).fail(function(err) {
      $('#answer-form').before(err["responseText"])
    })
    $('#answer-errors').remove();
    $('#answer-text').val("");
  });
});

// Question-based Response-based AJAX
$(document).ready(function () {
  $('#new-question-comment-link').click(function (event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(event.target).attr("href"),
      method: "GET"
    });

    request.done(function (response) {
      // debugger;
      $(event.target).hide();
      $(event.target).after(response);
    });
  });

  $('#new-question-comment-container').on("submit", "#new-question-comment-form", function(event) {
    event.preventDefault();
    var input_data = $(this).serialize();

    var request = $.ajax({
      url: $(event.target).attr("action"),
      method: $(event.target).attr("method"),
      data: input_data
    });

    request.done(function (response) {
      $(event.target).hide();
      $("#question-comments").append(response);
      var addCommentLink = $(event.target).closest("#question-comments").find("#new-question-comment-link");
      $(event.target).closest("#question-comments").find("#new-question-comment-link").remove();
      $("#question-comments").append(addCommentLink);
      $(addCommentLink).show();
    });
  });
});

// Answer-based Response-based AJAX
$(document).ready(function () {
  $('#new-answer-comment-link').click(function (event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(event.target).attr("href"),
      method: "GET"
    });

    request.done(function (response) {
      debugger;
      $(event.target).hide();
      $(event.target).after(response);
    });
  });

  $('#new-answer-comment-container').on("submit", "#new-answer-comment-form", function(event) {
    event.preventDefault();
    var input_data = $(this).serialize();

    var request = $.ajax({
      url: $(event.target).attr("action"),
      method: $(event.target).attr("method"),
      data: input_data
    });

    request.done(function (response) {
      $(event.target).hide();
      $("#answer-comments").append(response);
      var addCommentLink = $(event.target).closest("#answer-comments").find("#new-answer-comment-link");
      $(event.target).closest("#answer-comments").find("#new-answer-comment-link").remove();
      $("#answer-comments").append(addCommentLink);
      $(addCommentLink).show();
    });
  });

  $('#upvote-button').on('submit', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    $.ajax({
      method: 'post',
      url: '/questions/'+question_id+'/upvote'
    }).done(function(response){
      $('.vote-count').text('Vote Count: ' + response);
    })
  });

   $('#downvote-button').on('submit', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    $.ajax({
      method: 'post',
      url: '/questions/'+question_id+'/downvote'
    }).done(function(response){
      $('.vote-count').text('Vote Count: ' + response);
    })
  });


});
