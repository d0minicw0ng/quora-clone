class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])

    unless params[:conversation_id]
      @conversation = Conversation.create!
      @message.conversation_id = @conversation.id
    end

    @message.save!
    redirect_to root_url
  end
end
