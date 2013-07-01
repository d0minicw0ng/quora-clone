class FollowUserRelationship < ActiveRecord::Base
  attr_accessible :followed_user_id, :follower_id
	validates_presence_of :followed_user_id, :follower_id
	validates_uniqueness_of :followed_user_id, :scope => :follower_id
end
