$(document).ready(function () {
  $('#new-question-comment-link').click(function (event) {
    event.preventDefault();
    // var request = $.ajax({
    //   url: $(event.target).attr("href"),
    //   method: GET
    // });

    // request.done(function (response) {
    //   debugger;
    // });
  });

  // $('#new-question-comment-container').on("submit", "#new-question-comment-form", function(event) {
  //     event.preventDefault();
  //     var input_data = $(this).serialize();

  //     var request = $.ajax({
  //       url: $(event.target).attr("action"),
  //       method: $(event.target).attr("method"),
  //       data: input_data
  //     });

  //     request.done(function (response) {

  //     });
  // });












  // $('#new-answer-comment-container').on("submit", "#new-answer-comment", function(event) {
  //    event.preventDefault();
  // });
});
