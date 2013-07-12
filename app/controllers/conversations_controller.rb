class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = Conversation
      .includes(messages: [:sender, :receiver]).find(params[:id])
    @conversation.messages.sort_by { |message| message.created_at }.reverse!
    @message = Message.new
    @conversation.mark_as_read if @conversation.last_message.sender != current_user
  end
end
