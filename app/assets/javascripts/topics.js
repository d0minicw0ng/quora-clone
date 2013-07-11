var addTopicQuestion = function(){
	$(".add_question").on("click", function(){
		$(".add_question_form").toggleClass("hidden")
	})
}

var followUnfollowTopics = function(){
	$(".follow_topic").on("ajax:success", function(){
		$(".follow_topic").toggleClass("hidden");
		$(".unfollow_topic").toggleClass("hidden");

		var count = parseInt($(".followers").html().replace(/\s.+/, "")) + 1;
		$(".followers").html(count + " " + owl.pluralize("Follower", count));
	})
	$(".unfollow_topic").on("ajax:success", function(){
		$(".follow_topic").toggleClass("hidden");
		$(".unfollow_topic").toggleClass("hidden");

		var count = parseInt($(".followers").html().replace(/\s.+/, "")) - 1;
		$(".followers").html(count + " " + owl.pluralize("Follower", count));
	})
}