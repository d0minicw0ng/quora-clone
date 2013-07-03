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

		render :json => @comment
	end
end
