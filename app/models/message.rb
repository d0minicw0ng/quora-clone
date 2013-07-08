class Message < ActiveRecord::Base
  attr_accessible :content, :sender_id, :receiver_id, :conversation_id

  validates_uniqueness_of [:sender_id, :receiver_id],
    :scope => :conversation_id

  validates_presence_of :content, :sender_id, :receiver_id, :conversation_id

  belongs_to :conversation

  belongs_to :sender,
             :class_name => "User",
             :foreign_key => :sender_id

  belongs_to :receiver,
             :class_name => "User",
             :foreign_key => :receiver_id

  attr_reader :user_id, :receiver_token

  def receiver_token=(id)
    self.user_id = id
  end

  def user_id=(id)
    self.receiver_id = id
  end
end
