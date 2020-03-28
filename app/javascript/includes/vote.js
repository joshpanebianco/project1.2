$(function(){
  console.log("Hey")
	$(".vote").on("click", ".upvote, .downvote", function(){
		var post_id = $(this).parent().data("id"),
		    is_upvote = $(this).hasClass("upvote");

		// console.log('upvote for post' + post_id);
		// console.log('downvote for post' + is_upvote);

		$.ajax({
			url: "/post/vote",
			method: "POST",
			data: { post_id: post_id, upvote: is_upvote },
      dataType: "script",
			success: function(){
				console.log("success..");
			}
		})

	});
});
