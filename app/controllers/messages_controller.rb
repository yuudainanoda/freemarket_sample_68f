class MessagesController < ApplicationController
  def new
   
   
  end

  def create
    @message = Messages.create(message_params)
    # if @message.save   
    #   @msg = "いいよ"
    # else
    #   @msg = "ダメ"
    # end
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
