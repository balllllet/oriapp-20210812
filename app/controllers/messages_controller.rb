class MessagesController < ApplicationController

  def create
    @message = Item.order("created_at ASC")
    @message = Message.new(message_params,)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message, user: current_user
    end
  end

  # def destroy
  #   @message = Message.all
  # end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
