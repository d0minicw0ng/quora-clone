class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])

    unless params[:message][:conversation_id]
      @conversation = Conversation.create!
      @message.conversation_id = @conversation.id
    end

    @message.save!
    render :json => @message.as_json(:include => :sender)
  end
end
