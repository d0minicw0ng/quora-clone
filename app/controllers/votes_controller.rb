class VotesController < ApplicationController
	def create
		@vote = current_user.votes.build(params[:vote])
		@vote.save!
		
		render :json => @vote
	end
	
	def destroy
	end
end
