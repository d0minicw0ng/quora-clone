Quora.Views.QuestionsIndexView = Backbone.View.extend({
	initialize: function(){
		var that = this;
		var events = ["add", "change", "remove"];
		_(events).each(function(event){
			that.listenTo(that.collection, event, that.render);
		})
	},
	
	template: JST["questions/index"],
	
	render: function(){
		var that = this;
		var renderedContent = that.template({
			questions: that.collection
		})
		
		that.$el.html(renderedContent);
		return that;
	}
})