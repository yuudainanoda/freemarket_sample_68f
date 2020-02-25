class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.limit(3).order(id: "DESC")
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  def show
    @message = Message.new
    @messages = @item.messages.order(id: "ASC").includes(:user)
  end

  def edit
  end

  def update
    @item.update(item_update_params)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name,:price,:description,:brand,:category,:condition,:deriver_charge,:area,:deriver_date,[images_attributes: [:image_url]]).merge(user_id:current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name,:price,:description,:brand,:category,:condition,:deriver_charge,:area,:deriver_date,[images_attributes: [:image, :_destroy, :id]]).merge(user_id:current_user.id)
  end
end
