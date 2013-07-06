PublicActivity::Activity.class_eval do
  has_many :notifications,
           :class_name => "Notification",
           :foreign_key => :activity_id,
           :dependent => :destroy
end