class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity
      .order('created_at DESC')
      .paginate(
        :page => params[:page],
        :per_page => 10)
    # @activities = PublicActivity::Activity.order("created_at desc")
    @topics = Topic.trending_topics[0..5]
  end
end
