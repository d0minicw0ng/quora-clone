class CommentsController < ApplicationController
	def create
		@comment = current_user.answers.build(params[:comment])
		@comment.save!
    @comment.create_activity :create, owner: current_user

    render :json => @comment.as_json(:include => [:answerer, :votes])
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

    @activities = PublicActivity::Activity.where("trackable_type = ?
      AND trackable_id = ?", "Comment", params[:id])
    @activities.each { |activity| activity.destroy }

		render :json => @comment
	end
end
