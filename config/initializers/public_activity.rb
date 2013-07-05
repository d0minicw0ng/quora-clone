PublicActivity::Activity.class_eval do
  belongs_to :question,
             -> { where :trackable_type => Question },
             :foreign_key => :trackable_id
end