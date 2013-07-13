class MessagesController < ApplicationController
  def create
    if params[:message]["receiver_name"]
      receiver = User.find_by_username(params[:message]["receiver_name"])
      params[:message].delete("receiver_name")
      @message = Message.new(params[:message].merge(receiver_id: receiver.id))
    else
      @message = Message.new(params[:message])
    end

    unless params[:message][:conversation_id]
      @conversation = Conversation.create!
      @message.conversation_id = @conversation.id
    end

    @message.save!
    @message.conversation.mark_as_unread

    Pusher['test_channel'].trigger('form_submit', @message.to_json)

    respond_to do |format|
      format.json { render :json => @message.as_json(:include => [:sender]) }
      format.html { redirect_to conversation_url(@message.conversation) }
    end
  end
end
