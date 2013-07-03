class TopicsController < ApplicationController
  def index
    @topics = Topic.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}"])
  end

  def show
    @topic = Topic.find(params[:id])
  end
end
