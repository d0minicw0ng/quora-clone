Quora.Routers.Questions = Backbone.Router.extend({
	initialize: function(options){
		this.$rootEl = options.$rootEl;
		this.questions = options.questions;
	},
	
	routes: {
		"": "index",
		"questions/:id": "show"
	},
	
	index: function(){
		var that = this;
		var questions = new Quora.Collections.Questions();
		questions.fetch({
			success: function(questions){
				var questionsIndexView = new Quora.Views.QuestionsIndexView({
					collection: questions
				})
				
				that.$rootEl.html(questionsIndexView.render().$el)
			}
		})
	},
	
	show: function(id){
		var that = this;
		var question = that.questions.findWhere({ id: parseInt(id)})
		
		var questionShowView = new Quora.Views.QuestionShowView({
			model: question
		})
		
		that.$rootEl.html(questionShowView.render().$el)
	}
})
