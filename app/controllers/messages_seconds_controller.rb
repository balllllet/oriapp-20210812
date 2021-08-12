class MessagesSecondsController < ApplicationController
  def create
    @messages_second = Message.new(message_params)
    if @message_second.save
      ActionCable.server.broadcast 'message_channel', content: @message_second, user: current_user
    end
  end

  private
  def message_params
    params.require(:message_second).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
