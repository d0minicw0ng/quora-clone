class RootController < ApplicationController
  def root
    @questions = Question.all
  end
end
