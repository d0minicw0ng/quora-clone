var msgAutoComplete = function(){
	$(".message_receiver_tokens").tokenInput("/users.json", {
		crossDomain: false,
		tokenLimit: 1,
		propertyToSearch: "username",
		prePopulate: $(".message_receiver_tokens").data("pre"),
		theme: "facebook"
	});
}

var msgFormPopup = function(){
	$(".popup_msg_form").on("click", function(){
		$(".new_msg_form").bPopup();
	})
}