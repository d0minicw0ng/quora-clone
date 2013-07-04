class QuestionTopicRelationshipsController < ApplicationController
  def create
    @rel = QuestionTopicRelationship.new(params[:question_topic_relationship])
    @rel.save!

    question = Question.find(params[:question_topic_relationship][:question_id])
    @rel.create_activity :create, owner: question

    render :json => @rel
  end

  def destroy
    @rel = QuestionTopicRelationship.where("topic_id = ? AND question_id = ?",
      params[:topic_id],
      params[:question_id])

    @rel.destroy(@rel)

    render :json => @rel
  end
end
