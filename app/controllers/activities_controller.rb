class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order('created_at DESC')
    @activities = @activities.select do |activity|
      (activity.owner_type == "User" &&
        (current_user.followed_user_ids.include?(activity.owner_id)) ||
          activity.owner_id != current_user.id) ||
      (activity.owner_type == "Question" &&
        current_user.followed_question_ids.include?(activity.owner_id)) ||
      (activity.trackable_type == "Topic" &&
        current_user.followed_topic_ids.include?(activity.trackable_id))
    end

    @topics = Topic.trending_topics[0..5]
  end
end
