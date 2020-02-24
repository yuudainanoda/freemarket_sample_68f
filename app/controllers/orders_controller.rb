class OrdersController < ApplicationController

  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
  end

  def  done
    # @product_purchaser= Order.find(params[:id])
    # @product_purchaser.update( order_id: current_user.id)
    @order = Order.find(params[:id])

    
   end

  #  def pay
  #   card = Card.where(user_id: current_user.id).first
  #   Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #   Payjp::Charge.create(
  #   :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
  #   :customer => card.customer_id, #顧客ID
  #   :currency => 'jpy', #日本円
  # )
  # redirect_to action: 'done' #完了画面に移動
  # end

   def show
    # @order = Order.new
    # @orders = current_order.order_items
    # @orders = Order.find(params[:id])
   end
   


   

end
