Quora.Views.QuestionShowView = Backbone.View.extend({
	
	template: JST["questions/show"],
	
	initialize: function(){
		var that = this;
		var events = ["add", "change", "remove", "reset"];
		_(events).each(function(event){
			that.listenTo(that.model, event, that.render)
		})
	},
		
	render: function(id){
		var that = this;
		
		if (!that.model){
			that.model = Quora.questions.findWhere({ id: parseInt(id) })
		}
		
		var renderedContent = that.template({
			question: that.model
		})
		
		that.$el.html(renderedContent);
		return that;
	}
});