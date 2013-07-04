class FeedsController < ApplicationController
  def top_questions
    @questions = Question.all.sort_by{ |question| question.followers }.reverse!
  end

  def most_recent
    @questions = Question.most_recent_questions
  end
end
