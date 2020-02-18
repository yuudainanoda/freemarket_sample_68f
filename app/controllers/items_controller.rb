class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    # @comment = Comment.find(params[:id])
    @message = Message.new
    @messages = @item.messages.includes(:id)

  end

end
