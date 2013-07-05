class FollowUserRelationshipsController < ApplicationController
  def create
    @rel = FollowUserRelationship.new(params[:follow_user_relationship])
    @rel.follower_id = current_user.id
    @rel.save!
    @rel.create_activity :create,
      owner: current_user,
      recipient: @rel

    render :json => @rel
  end

  def destroy
    @rel = FollowUserRelationship.where("follower_id = ?
      AND followed_user_id = ?",
      current_user.id,
      params[:follow_user_relationship][:followed_user_id])

    @rel.destroy(@rel)

    render :json => @rel
  end
end
