class FeedsController < ApplicationController
  def top_questions
    @questions = Question.all.sort_by{ |question| question.followers }.reverse!
    @topics = Topic.trending_topics[0..5]
  end

  def most_recent
    @questions = Question
      .order('created_at DESC')
      .paginate(:page => params[:page], :per_page => 10)

    @topics = Topic.trending_topics[0..5]
  end
end
