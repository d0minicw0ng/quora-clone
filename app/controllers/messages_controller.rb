class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])

    unless params[:message][:conversation_id]
      @conversation = Conversation.create!
      @message.conversation_id = @conversation.id
    end

    @message.save!
    @message.conversation.mark_as_unread

    respond_to do |format|
      format.json { render :json => @message.as_json(:include => [:sender]) }
      format.html { redirect_to conversation_url(@message.conversation) }
    end
  end
end
