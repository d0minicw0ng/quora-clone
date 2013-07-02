class Comment < ActiveRecord::Base
  attr_accessible :body, :question_id, :answerer_id, :parent_comment_id
	validates_presence_of :body, :question_id, :answerer_id
	
	has_many :child_comments,
					 :class_name => "Comment",
					 :foreign_key => :parent_comment_id,
					 :dependent => :destroy
					 
	belongs_to :parent_comment,
 						 :class_name => "Comment",
						 :foreign_key => :parent_comment_id
						 
	belongs_to :question
	
	belongs_to :answerer,
						 :class_name => "User",
						 :foreign_key => :answerer_id
	
	has_many :votes, 
					 :class_name => "Vote",
					 :foreign_key => :answer_id,
					 :dependent => :destroy
					 
	def self.root_answers(comments)
		comments.select { |comment| comment.parent_comment_id.nil? }
	end
end
