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