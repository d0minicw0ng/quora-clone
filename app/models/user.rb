class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
				 :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
									:username,
								  :password,
									:password_confirmation,
									:remember_me,
                  :profile_picture

	has_attached_file :profile_picture,
										:styles => {
											:big => '200x200>',
											:small => '50x50#'
									  }

	has_many :questions,
			     :class_name => "Question",
					 :foreign_key => :asker_id,
					 :dependent => :destroy

  has_many :answers,
 					 :class_name => "Comment",
					 :foreign_key => :answerer_id,
					 :dependent => :destroy

	has_many :followed_relationships,
	 				 :class_name => "FollowUserRelationship",
 					 :foreign_key => :followed_user_id,
					 :dependent => :destroy

 	has_many :following_relationships,
 	 				 :class_name => "FollowUserRelationship",
  				 :foreign_key => :follower_id

  has_many :followers,
 					 :through => :followed_relationships,
					 :source => :follower

	has_many :followed_users,
					 :through => :following_relationships,
					 :source => :followed_user

	has_many :follow_question_relationships,
           :class_name => "FollowQuestionRelationship",
           :foreign_key => :follower_id,
           :dependent => :destroy

	has_many :followed_questions,
					 :through => :follow_question_relationships,
					 :source => :question


	has_many :follow_topic_relationships,
					 :class_name => "FollowTopicRelationship",
					 :foreign_key => :follower_id,
					 :dependent => :destroy

	has_many :followed_topics,
		 			 :through => :follow_topic_relationships,
 					 :source => :topic

	has_many :votes,
					 :class_name => "Vote",
					 :foreign_key => "voter_id",
					 :dependent => :destroy

  def has_vote?(answer)
    vote = Vote.where("answer_id = ? AND voter_id = ?", answer.id, self.id)
    vote.empty? ? false : true
  end
end
