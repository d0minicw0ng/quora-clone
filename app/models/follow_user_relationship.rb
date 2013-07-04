class FollowUserRelationship < ActiveRecord::Base
  include PublicActivity::Common

  attr_accessible :followed_user_id, :follower_id

  belongs_to :followed_user,
             :class_name => "User",
             :foreign_key => :followed_user_id

  belongs_to :follower,
             :class_name => "User",
             :foreign_key => :follower_id

	validates_presence_of :followed_user_id, :follower_id
	validates_uniqueness_of :followed_user_id, :scope => :follower_id
end
