class QuestionTopicRelationshipsController < ApplicationController
  def create
    @rel = QuestionTopicRelationship.new(params[:question_topic_relationship])
    @rel.save!

    question = Question.find(params[:question_topic_relationship][:question_id])
    @rel.create_activity :create, owner: question

    render :json => @rel.as_json(:include => :topic)
  end

  def destroy
    @rel = QuestionTopicRelationship.where("topic_id = ? AND question_id = ?",
      params[:topic_id],
      params[:question_id]).first

    @activities = PublicActivity::Activity.where(
      "trackable_type = ?
      AND trackable_id = ?
      AND owner_id = ?",
      "QuestionTopicRelationship",
      params[:topic_id],
      params[:question_id])
    @activities.each(&:destroy)

    @rel.destroy

    render :json => @rel
  end
end
