class FollowQuestionRelationshipsController < ApplicationController
  def create
    @rel = FollowQuestionRelationship.new(params[:follow_question_relationship])
    @rel.follower_id = current_user.id
    @rel.save!
    @rel.create_activity :create, owner: current_user

    render :json => @rel
  end

  def destroy
    q_id = params[:follow_question_relationship][:question_id]
    @rel = FollowQuestionRelationship
      .where("follower_id = ? AND question_id = ?", current_user.id, q_id)
      .first

    @activities = PublicActivity::Activity.where("trackable_type = ?
      AND trackable_id = ?", "FollowQuestionRelationship", q_id)
    @activities.each { |activity| activity.destroy }

    @rel.destroy

    render :json => @rel
  end
end
