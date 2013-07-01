class Topic < ActiveRecord::Base
  attr_accessible :name
	
	has_many :follow_topic_relationships
	
	has_many :followers, 
		 			 :through => :follow_topic_relationships,
 					 :source => :follower
					 
end
