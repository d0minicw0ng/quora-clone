class Topic < ActiveRecord::Base
  include PublicActivity::Common

  attr_accessible :name

  validates_uniqueness_of :name

	has_many :follow_topic_relationships

	has_many :followers,
		 			 :through => :follow_topic_relationships,
 					 :source => :follower

  has_many :question_topic_relationships, :dependent => :destroy

  has_many :questions, :through => :question_topic_relationships

  def self.trending_topics
    Topic.all.sort_by! { |topic| - topic.followers.count }
  end
end
