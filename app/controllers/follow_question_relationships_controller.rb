class FollowQuestionRelationshipsController < ApplicationController
  def create
    @rel = FollowQuestionRelationship.new(params[:follow_question_relationship])
    @rel.follower_id = current_user.id
    @rel.save

    # redirect_to question_url(params[:follow_question_relationship][:question_id])
    render :json => @rel
  end

  def destroy
    # @rel = FollowQuestionRelationship.find(params[:follow_question_relationship])
    @rel = FollowQuestionRelationship.where("follower_id = ? AND question_id = ?",
      current_user.id, params[:follow_question_relationship][:question_id])
    @rel.destroy(@rel)

    # redirect_to question_url(params[:follow_question_relationship][:question_id])
    render :json => @rel
  end
end
