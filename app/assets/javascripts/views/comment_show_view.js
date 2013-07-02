Quora.Views.CommentShowView = Backbone.View.extend({
	events: {
		"click div#leave_answer": "answer"
	},
	
	template: JST["answers/show"],
	
	render: function(){
		return that;
	},
	
	answer: function(){
		var that = this;
		$.ajax({
			url: "/comments",
			type: "POST",
			success: function(event, data){
				console.log(data)
				var renderedContent = that.template({ comment: data })
				that.$el.html(renderedContent);
				return that;
			}})
	}
})