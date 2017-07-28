$(document).ready(function() {
  $(".comments_stuff").on("submit", function(event){
    event.preventDefault();
    var $that = $(this)
    var data = $(this).serialize();

    var method = $(this).attr("method");
    var url = $(this).attr("action")
    $.ajax({
      method: 'post',
      url: url,
      data: data
    })
    .done(function(response){

      $(".comments-list").append(response);
      $(".comments_stuff").trigger("reset");
    })
  })
});
