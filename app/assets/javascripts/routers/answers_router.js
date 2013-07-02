Quora.Routers.Answers = Backbone.Router.extend({
	initialize: function(options){
		this.$rootEl = options.$rootEl;
	},
	
	routes: {
		"questions/:id": "show"
	},
	
	show: function(){
		var that = this;
		var answerShowView = new Quora.Views.AnswerShowView();
		
		that.$rootEl.append(answerShowView.render().$el)
	}	
})