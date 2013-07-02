class QuestionsController < ApplicationController
	def create
		@question = current_user.questions.build(params[:question])
		@question.save!
		
		render :json => @question
	end
	
	def index
		questions = Question.all
		
		render :json => questions.as_json(:includes => [:asker])
	end
	
	def show
		@question = Question.includes(:answers).find(params[:id])
		@answers = Comment.root_answers(@question.answers)
		@comment = Comment.new
		
		render :show 
	end
end
