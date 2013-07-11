var addTopicQuestion = function(){
	$(".add_question").on("click", function(){
		$(".add_question_form").toggleClass("hidden")
	})
}

var followUnfollowTopics = function(){
	$(".follow_topic").on("ajax:success", function(){
		$(".follow_topic").toggleClass("hidden");
		$(".unfollow_topic").toggleClass("hidden");
	})
	$(".unfollow_topic").on("ajax:success", function(){
		$(".follow_topic").toggleClass("hidden");
		$(".unfollow_topic").toggleClass("hidden");
	})
}