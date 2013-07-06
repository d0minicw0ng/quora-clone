class Notification < ActiveRecord::Base
  attr_accessible :user_id, :activity_id, :is_read

  validates_presence_of :user_id

  alias_attribute :is_read?, :is_read

  belongs_to :user

  belongs_to :activity,
             :class_name => "PublicActivity::Activity",
             :foreign_key => :activity_id

  def mark_as_read
    self.is_read = true
    self.save!
  end
end
