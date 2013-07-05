class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity
      .order('created_at DESC')
      .paginate(
        :page => params[:page],
        :per_page => 10)
    @topics = Topic.trending_topics[0..5]
  end
end
