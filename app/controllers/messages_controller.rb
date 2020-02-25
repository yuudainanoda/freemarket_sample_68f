class MessagesController < ApplicationController
  def new
   
  end

  def create
    @message = Message.create(message_params)
    redirect_to item_path(params[:item_id])
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
