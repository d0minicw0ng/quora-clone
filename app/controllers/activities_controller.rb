class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order('created_at DESC')

    @activities.select do |activity|
      (activity.owner_type.is_a?(User) &&
        current_user.followed_user_ids.include?(activity.owner_id)) ||
      (activity.owner_type.is_a?(Question) &&
        current_user.followed_question_ids.include?(activity.owner_id))
    end

    @topics = Topic.trending_topics[0..5]
  end
end
