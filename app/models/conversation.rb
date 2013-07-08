class Conversation < ActiveRecord::Base
  attr_accessible :is_read
  alias_attribute :is_read?, :is_read

  has_many :messages

  def mark_as_read
    self.update_attributes(:is_read => true)
  end

  def last_message
    self.messages.sort_by { |message| message.created_at }.last
  end

  def sender
    self.messages.first.sender
  end

  def receiver
    self.messages.first.receiver
  end
end
