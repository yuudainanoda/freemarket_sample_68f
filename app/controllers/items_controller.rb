class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(3)
    

  end

  def new
    @item = Item.new
    @user = User.new
    
  end

 

  def show
    @item = Item.find(params[:id])
    @message = Message.new
    @order = Order.new
    @orders = Order.find(params[:id])
    @users = User.find(params[:id])
   
  end

  def done
    
  end


end
