class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(3)

  end

  def new
    @item = Item.new
    
  end
  
  def show
    @item = Item.find(params[:id])
    @message = Message.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

end
