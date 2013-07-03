class FollowTopicRelationshipsController < ApplicationController
  def create
    @rel = FollowTopicRelationship.new(params[:follow_topic_relationship])
    @rel.follower_id = current_user.id
    @rel.save

    render :json => @rel
  end

  def destroy
    @rel = FollowTopicRelationship.where("follower_id = ? AND topic_id = ?",
      current_user.id, params[:follow_topic_relationship][:topic_id])
    @rel.destroy(@rel)

    render :json => @rel
  end
end
