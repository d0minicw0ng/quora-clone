class VotesController < ApplicationController
	def create
		@vote = current_user.votes.build(params[:vote])
		@vote.save!

		render :json => @vote
	end

	def destroy
    @vote = Vote.where("voter_id = ? AND answer_id = ?",
      current_user.id,
      params[:vote][:answer_id]).first
    @vote.destroy

    render :json => @vote
	end
end
