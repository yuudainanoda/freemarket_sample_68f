class MessagesController < ApplicationController
  def new
   
  end

  def create
    @message = Messages.create(message_params)
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
