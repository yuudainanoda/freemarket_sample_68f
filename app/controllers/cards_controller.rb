class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  # def new
  #   if @card
  #     redirect_to card_path unless @card
  #   else
  #     render 'order/create_card'
  #   end
  # end

  def pay
    binding.pry
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Order.create(
        card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id, order_id: order.id, card_id: order.default_card)
      if @card.save
        redirect_to action:"show"
      else
        redirect_to action:"pay"
      end
    end
  end


  # def create
  #   binding.pry
  #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #   if params['payjp-token'].blank?
  #     render 'show/create_card'
  #   else
  #     customer = Payjp::Order.create( # ここで先ほど生成したトークンを顧客情報と紐付け、PAY.JP管理サイトに送信
  #       email: current_user.email,
  #       card: params['payjp-token'],
  #     )
  #     @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
  #     if @card.save
  #       redirect_to card_path
  #     else
  #       render 'order/create_card'
  #     end
  #   end
  # end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      order = Payjp::Order.retrieve(card.order_id)
      # @default_card_information = order.cards.retrieve(card.card_id)
    end
  end


end
