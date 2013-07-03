class Question < ActiveRecord::Base
  attr_accessible :title, :body, :asker_id
	validates_presence_of :title, :body

	belongs_to :asker,
						 :class_name => "User",
						 :foreign_key => :asker_id

  has_many :answers,
  				 :class_name => "Comment",
					 :foreign_key => :question_id,
					 :dependent => :destroy

	has_many :follow_question_relationships, :dependent => :destroy

	has_many :followers,
					 :through => :follow_question_relationships,
					 :source => :follower

  has_many :question_topic_relationships, :dependent => :destroy

  has_many :topics, :through => :question_topic_relationships


	def self.recent_unanswered_questions
		recent_questions = Question.where("created_at > ?", 2.weeks.ago)
		recent_questions.select { |question| question.answers.empty? }
	end
end