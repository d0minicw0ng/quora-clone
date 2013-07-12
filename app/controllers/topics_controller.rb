class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.save!
    FollowTopicRelationship.create!({topic_id: @topic.id, follower_id: current_user.id })
    @topic.create_activity :create,
      owner: current_user,
      recipient: @topic
    redirect_to topic_url(@topic)
  end

  def index
    @topics = Topic.where("name ILIKE ?", "%#{params[:q]}%")

    respond_to do |format|
      format.html
      format.json { render :json => @topics }
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @question = Question.new
    @rel = FollowTopicRelationship.new
  end

  def trending
    @topic = Topic.find(params[:id])
    @questions =
      @topic
        .questions
          .sort_by { |question| question.created_at }
          .reverse!

    @question = Question.new
    @rel = FollowTopicRelationship.new
  end
end
