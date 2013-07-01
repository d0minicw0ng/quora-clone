class Vote < ActiveRecord::Base
  attr_accessible :voter_id, :answer_id
	
	validates_presence_of :voter_id, :answer_id
	validates_uniqueness_of :voter_id, :scope => :answer_id
	
	belongs_to :voter,
						 :class_name => "User",
						 :foreign_key => :voter_id
						 
  belongs_to :answer,
 						 :class_name => "Comment",
						 :foreign_key => :answer_id
end
