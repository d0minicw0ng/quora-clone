Quora.Routers.Comments = Backbone.Router.extend({
	initialize: function(options){
		this.$rootEl = options.$rootEl;
	},
	
	routes: {
		"questions/:id": "show"
	},
	
	show: function(){
		var that = this;
		var commentShowView = new Quora.Views.CommentShowView();
		
		that.$rootEl.append(commentShowView.render().$el)
	}	
})