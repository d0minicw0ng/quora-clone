class FollowQuestionRelationship < ActiveRecord::Base
  include PublicActivity::Common

  attr_accessible :question_id, :follower_id

	belongs_to :question,
             :class_name => "Question",
             :foreign_key => :question_id

	belongs_to :follower,
						 :class_name => "User",
						 :foreign_key => :follower_id

	validates_uniqueness_of :question_id, :scope => :follower_id
end
