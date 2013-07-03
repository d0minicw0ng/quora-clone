class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.save!
    redirect_to topic_url(@topic)
  end

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @question = Question.new
  end

  def trending
    @topic = Topic.find(params[:id])
    @questions =
      @topic.questions.sort_by {|question| question.created_at }.reverse!
    @question = Question.new
  end
end
