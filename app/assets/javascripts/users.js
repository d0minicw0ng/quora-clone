var followUser = function(){
	$(".follow_user").on("ajax:success", function(){
		$(".follow_user").toggleClass("hidden");
		$(".unfollow_user").toggleClass("hidden");
	})
	$(".unfollow_user").on("ajax:success", function(){
		$(".follow_user").toggleClass("hidden");
		$(".unfollow_user").toggleClass("hidden");
	})
}

var showUserFollowers = function(){
	$("#user_followers").on("click", function(event){
		event.preventDefault();
		var user = JSON.parse($("#user_object").html());
		var renderedContent = JST["users/followers"]({
			user: user
		})
		$("#user_profile_content").html(renderedContent);
	})
}

var showUserFollowing = function(){
	$("#user_following").on("click", function(event){
		event.preventDefault();
		var user = JSON.parse($("#user_object").html());
		var renderedContent = JST["users/following"]({
			user: user
		})
		$("#user_profile_content").html(renderedContent);
	})
}

var showUserTopics = function(){
	$("#user_topics").on("click", function(event){
		event.preventDefault();
		var user = JSON.parse($("#user_object").html());
		var renderedContent = JST["users/topics"]({
			user: user
		})
		$("#user_profile_content").html(renderedContent);
	})
}

var showUserQuestions = function(){
	$("#user_questions").on("click", function(event){
		event.preventDefault();
		var user = JSON.parse($("#user_object").html());
		var renderedContent = JST["users/questions"]({
			user: user
		})
		$("#user_profile_content").html(renderedContent);
	})
}

var showUserAnswers = function(){
	$("#user_answers").on("click", function(event){
		event.preventDefault();
		var user = JSON.parse($("#user_object").html());
		var renderedContent = JST["users/answers"]({
			user: user
		})
		$("#user_profile_content").html(renderedContent);
	})
}