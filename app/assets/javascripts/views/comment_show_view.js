Quora.Views.AnswerShowView = Backbone.View.extend({
	events: {
		"click div#leave_answer": "answer"
	},
	
	template: JST["answers/show"],
	
	render: function(){
		return that;
	}
	
	answer: function(){
		var that = this;
		$.ajax(
			url: "/comments",
			type: "POST",
			success: function(response){
				console.log(response)
				var renderedContent = that.template({ comment: response })
				that.$el.html(renderedContent);
				return that;
			})
	}
	
	
})