class FollowTopicRelationship < ActiveRecord::Base
  attr_accessible :follower_id, :topic_id
	
	validates_presence_of :follower_id, :topic_id
	validates_uniqueness_of :topic_id, :scope => :follower_id
	
	belongs_to :follower,
						 :class_name => "User",
						 :foreign_key => :follower_id
	
	belongs_to :topic
end
