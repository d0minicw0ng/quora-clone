class FollowQuestionRelationshipsController < ApplicationController
  def create
    @rel = FollowQuestionRelationship.new(params[:follow_question_relationship])
    @rel.follower_id = current_user.id
    @rel.save!
    @rel.create_activity :create,
      owner: current_user,
      recipient: @rel

    render :json => @rel
  end

  def destroy
    @rel = FollowQuestionRelationship
      .where("follower_id = ? AND question_id = ?",
      current_user.id, params[:follow_question_relationship][:question_id])
      .first

    @rel.destroy

    render :json => @rel
  end
end
