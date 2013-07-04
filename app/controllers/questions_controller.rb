class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = current_user.questions.build(params[:question])
		@question.save!
    if params[:topic_id]
      @rel = QuestionTopicRelationship.new(
        :topic_id => params[:topic_id],
        :question_id => @question.id)
      @rel.save!
      @rel.create_activity :create, owner: @question
    end
    @question.create_activity :create, owner: current_user

		redirect_to question_url(@question)
	end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes!(params[:question])
      @question.create_activity :update, owner: current_user
    end

    render :json => @questeion
  end

	def index
		questions = Question.all

		render :json => questions.as_json(:includes => [:asker])
	end

	def unanswered
		@questions = Question.recent_unanswered_questions
	end

	def show
		@question = Question.includes(:answers, :topics).find(params[:id])
		@answers = Comment.root_answers(@question.answers)
		@comment = Comment.new
		@vote = Vote.new
    @rel = FollowQuestionRelationship.new
	end
end
