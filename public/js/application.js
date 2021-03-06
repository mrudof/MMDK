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
  $('#question-comments').on('click', '.new-question-comment-link', function (event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(event.target).attr("href"),
      method: "GET"
    });

    request.done(function(response) {
      $(event.target).hide();
      $(event.target).after(response);
    });
  });

  $('#question-comments').on("submit", "#new-question-comment-form", function(event) {
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
      var addCommentLink = $(event.target).closest("#question-comments").find(".new-question-comment-link");
      $(event.target).closest("#question-comments").find(".new-question-comment-link").remove();
      $("#question-comments").append(addCommentLink);
      $(addCommentLink).show();
    }).fail(function(err) {
      // debugger;
      $('#new-question-comment-form').before(err["responseText"])
    })
    $('.comment-question-errors').remove();
    $('.question-comment-text').val("");
  });
});

// Answer-based Response-based AJAX
$(document).ready(function () {
  $('.answer-comments').on('click', '.new-answer-comment-link', function (event) {
    event.preventDefault();
    var request = $.ajax({
      url: $(event.target).attr("href"),
      method: "GET"
    });

    request.done(function (response) {
      $(event.target).hide();
      $(event.target).after(response);
    });
  });

  $('.answer-comments').on("submit", "#new-answer-comment-form", function(event) {

    var answer_id = $(event.target).closest('.answer-comments').attr('id')

    event.preventDefault();
     // debugger;
    var input_data = $(this).serialize();

    var request = $.ajax({
      url: $(event.target).attr("action"),
      method: $(event.target).attr("method"),
      data: input_data
    });

    request.done(function (response) {
      // debugger;
      $(event.target).hide();
      $('#'+answer_id+'.answer-comments').append(response);
      var addCommentLink = $(event.target).closest(".answer-comments").find(".new-answer-comment-link");
      $(event.target).closest(".answer-comments").find(".new-answer-comment-link").remove();
      $(event.target).closest(".answer-comments").append(addCommentLink);
      $(addCommentLink).show();
    }).fail(function(err) {
      $('#new-answer-comment-form').after(err["responseText"])
    })
    $('.comment-answer-errors').remove();
    $('.answer-comment-text').val("");
  });
});

$(document).ready(function () {
  $('#upvote-button').on('submit', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    $.ajax({
      method: 'post',
      url: '/questions/'+question_id+'/upvote'
    }).done(function(response){
      $('#'+question_id+'.vote-count').text(response);
    })
  });

   $('#downvote-button').on('submit', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    $.ajax({
      method: 'post',
      url: '/questions/'+question_id+'/downvote'
    }).done(function(response){
      $('#'+question_id+'.vote-count').text(response);
    })
  });

   $('#answer-post').on('submit', '#answer-upvote-button', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    var answer_id = $(event.target).parent().parent().attr('id')

    $.ajax({
      method: 'post',
      url: '/questions/'+question_id+'/answers/'+answer_id+'/upvote'
    }).done(function(response){
      $('#'+answer_id+'.answer-vote').children('p').first().text(response);
    })
  });

$('#answer-post').on('submit', '#answer-downvote-button', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    var answer_id = $(event.target).parent().parent().attr('id')

    $.ajax({
      method: 'post',
      url: '/questions/'+question_id+'/answers/'+answer_id+'/downvote'
    }).done(function(response){
      $('#'+answer_id+'.answer-vote').children('p').first().text(response);
    })
  });


$('#answer-post').on('submit', '.favorite-form', function(event){
    event.preventDefault();
    var question_id = $('.question-title').attr('id')
    var answer_id = $(event.target).parent().attr('id')
    $.ajax({
      method: 'post',
      url: '/answers/'+answer_id+'/edit'
    }).done(function(response){
    $('#favorite-'+question_id+'').remove()

      $(event.target).after(response);
    })
  });
});
