class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		@question = current_user.questions.build(params[:question])
    @question.topic_ids << params[:question][:topic_id] if params[:question][:topic_id]
		@question.save!

		redirect_to question_url(@question)
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
