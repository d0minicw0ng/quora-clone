class QuestionTopicRelationship < ActiveRecord::Base
  include PublicActivity::Common

  attr_accessible :question_id, :topic_id

  attr_reader :topic_tokens

  validates_presence_of :question_id, :topic_id

  belongs_to :question
  belongs_to :topic

  def topic_tokens=(ids)
    self.topic_ids = ids.split(',')
  end
end
