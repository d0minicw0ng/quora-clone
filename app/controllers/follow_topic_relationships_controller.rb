class FollowTopicRelationshipsController < ApplicationController
  def create
    @rel = FollowTopicRelationship.new(params[:follow_topic_relationship])
    @rel.follower_id = current_user.id
    @rel.save!
    @rel.create_activity :create, owner: current_user

    render :json => @rel
  end

  def destroy
    t_id = params[:follow_topic_relationship][:topic_id]
    @rel = FollowTopicRelationship.where("follower_id = ? AND topic_id = ?",
      current_user.id, t_id).first
    @rel.destroy

    @activities = PublicActivity::Activity.where("trackable_type = ?
      AND trackable_id = ?", "FollowTopicRelationship", t_id)
    @activities.each(&:destroy)

    render :json => @rel
  end
end
