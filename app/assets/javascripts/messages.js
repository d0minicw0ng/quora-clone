var msgFormPopup = function(){
	$(".popup_msg_form").on("click", function(){
		$(".new_msg_form").dialog({ modal: true });
	})
}

var msgFormAutocomplete = function(){
	var userNames = [];
	var users = JSON.parse($("#users").html());
	for (var i = 0; i < users.length; i++){
		userNames.push(users[i].username)
	}

  $( ".receiver" ).autocomplete({ source: userNames });
}