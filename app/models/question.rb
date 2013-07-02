class Question < ActiveRecord::Base
  attr_accessible :title, :body, :asker_id
	validates_presence_of :title, :body
	
	belongs_to :asker,
						 :class_name => "User",
						 :foreign_key => :asker_id
						 
  has_many :answers,
  				 :class_name => "Comment",
					 :foreign_key => :question_id
					 
	has_many :follow_question_relationships
	
	has_many :followers,
					 :through => :follow_question_relationships,
					 :source => :follower

end
