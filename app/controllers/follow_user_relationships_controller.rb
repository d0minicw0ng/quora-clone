class FollowUserRelationshipsController < ApplicationController
  def create
    @rel = FollowUserRelationship.create!(
      params[:follow_user_relationship].merge({ follower_id: current_user.id }))
    activity = @rel.create_activity :create, owner: current_user
    Notification.create!({ activity_id: activity.id, user_id: activity.trackable_id })

    render :json => @rel
  end

  def destroy
    @rel = FollowUserRelationship.where("follower_id = ?
      AND followed_user_id = ?",
      current_user.id,
      params[:follow_user_relationship][:followed_user_id]).first

    @rel.destroy

    render :json => @rel
  end
end
