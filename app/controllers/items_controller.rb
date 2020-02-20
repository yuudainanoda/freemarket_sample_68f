class ItemsController < ApplicationController


  def index
    @items = Item.all.limit(3)

  end

  def new
    @item = Item.new
    
  end




  # def show
  #   @item = Item.find(params[:id])
  #   # @comment = Comment.find(params[:id])
  #   @message = Message.new
  #   @messages = @item.messages.includes(:id)

  # end



  

end
