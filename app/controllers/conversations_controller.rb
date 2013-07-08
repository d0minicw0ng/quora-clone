class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = Conversation
      .includes(:messages).find(params[:id])
    @conversation.messages.sort_by { |message| message.created_at }.reverse!
    @message = Message.new
    @conversation
  end
end
