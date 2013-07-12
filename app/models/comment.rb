class Comment < ActiveRecord::Base
  include PublicActivity::Common

  attr_accessible :body, :question_id, :answerer_id
	validates_presence_of :body, :question_id, :answerer_id

	belongs_to :question

	belongs_to :answerer,
						 :class_name => "User",
						 :foreign_key => :answerer_id

	has_many :votes,
					 :class_name => "Vote",
					 :foreign_key => :answer_id,
					 :dependent => :destroy
end
