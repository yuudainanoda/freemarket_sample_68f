class OrdersController < ApplicationController
  def done
    @product_purchaser= Order.find(params[:id])
    @product_purchaser.update( order_id: current_user.id)
  end

  def new
    @item = Item.find(params[:item_id])
    @user = User.find(@item.user_id)
  end

  def create
  end

end
