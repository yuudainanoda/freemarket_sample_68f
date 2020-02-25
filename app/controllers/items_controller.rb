class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(3)
  end

  def new
    @item = Item.new
    
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_update_params)
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.images.build
    @message = Message.new
  end

  private
  def item_params
    params.require(:item).permit(:name,:price,:description,:brand,:category,:condition,:deriver_charge,:area,:deriver_date,[images_attributes: [:image_url]]).merge(user_id:current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name,:price,:description,:brand,:category,:condition,:deriver_charge,:area,:deriver_date,[images_attributes: [:image, :_destroy, :id]]).merge(user_id:current_user.id)
  end
end
