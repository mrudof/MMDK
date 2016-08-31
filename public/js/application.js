$(document).ready(function () {

  $('#new-answer-submit').submit(function(event){
    $event.preventDefault;
    $.ajax({
      method: 'post',
      url: '/answers'
    }).done(function(response){
      $(response).after('#answer-post')
    })
  });

});
