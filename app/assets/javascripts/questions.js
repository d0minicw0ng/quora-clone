var leaveComment = function(){
	$(".new_comment").on("ajax:success", function(event, data){
		var user = JSON.parse($("#current_user_id").html());
		var url = JSON.parse($("#current_user_avatar").html());
		var template = JST["comments/show"]({
			comment: data,
			voter: user,
			url: url
		})
		$("#answers").append(template);
		$(".new_comment").find("textarea").val("");
		var count = parseInt($("#answers_count").html().replace(/\s.+/, "")) + 1;
		$("#answers_count").html(count + " " + owl.pluralize("Answer", count));
	})
};

var toggleFollowButton = function(){
	$(".follow_question").on("ajax:success", function(){
		$(".follow_question").toggleClass("hidden");
		$(".unfollow_question").toggleClass("hidden");
	})
	$(".unfollow_question").on("ajax:success", function(){
		$(".follow_question").toggleClass("hidden");
		$(".unfollow_question").toggleClass("hidden");
	})
};

var removeTopicTag = function(){
	$(".remove_topic_tag").on("ajax:success", function(){
		$(this).parent("span").remove()
	})
}

var getCommentArea = function(){
	$(".get_comment_area").on("click", function(event){
		$(".comment_area").toggleClass("hidden");
	})
}

var deleteComment = function(){
	$("ul#answers").on("ajax:success", ".delete_comment", function(){
		$(this).parent("li").remove();
		var count = parseInt($("#answers_count").html().replace(/\s.+/, "")) - 1;
		$("#answers_count").html(count + " " + owl.pluralize("Answer", count));
	})
}

var toggleVote = function(){
	$("ul").on("ajax:success", ".upvote", function(event){
		var count =
			parseInt($(this).closest("li").find(".votes_count").html().replace(/\s/, "")) + 1;
			console.log(count)
		$(this).parent("div").toggleClass("vote").toggleClass("unvote")
		$(this).closest("li").find(".votes_count").html(count + " " + owl.pluralize('vote', count));
	});

	$("ul").on("ajax:success", ".downvote", function(event){
		var count =
			parseInt($(this).closest("li").find(".votes_count").html().replace(/\s/, "")) - 1;
		$(this).parent("div").toggleClass("vote").toggleClass("unvote")
		$(this).closest("li").find(".votes_count").html(count + " " + owl.pluralize('vote', count));
	});
}

var toggleReplyBox = function(){
	$("ul").on("click", "li a.new_reply", function(event){
		event.preventDefault();
		var i = $(this).attr("id");
		$(".child_comment_area_" + i).toggleClass("hidden")
	});
}

var autocomplete = function(){
	$("#question_topic_tokens").tokenInput("/topics.json", {
		crossDomain: false,
		prePopulate: $("#question_topic_tokens").data("pre"),
		theme: "facebook"
	});
}