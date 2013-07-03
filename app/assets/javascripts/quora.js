window.Quora = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		Quora.questions = new Quora.Collections.Questions();
		Quora.questions.fetch();
		
	 	new Quora.Routers.Questions({
			$rootEl: $("#top_stories"),
			questions: Quora.questions
		});
		
		Backbone.history.start();
  }
};

$(function(){
  window.Quora.initialize();
});

