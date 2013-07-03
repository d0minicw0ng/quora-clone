class FeedsController < ApplicationController
  def root
    @questions = Question.all
  end

  def most_recent
    @questions = Question.most_recent_questions
  end
end
