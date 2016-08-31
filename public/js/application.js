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
