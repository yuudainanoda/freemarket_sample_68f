class CardsController < ApplicationController
  before_action  :set_card, only: [:new, :pay, :delete, :show, :up]
  
  require "payjp"

  def new
    @card = Card.new
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      card = Card.new(user_id: current_user.id, order_id: customer.id, card_id: customer.default_card)
      if card.save
        redirect_to action:"up"
      else
        redirect_to action:"pay"
      end
    end
  end


  def delete #PayjpとCardデータベースを削除します
    if Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.order_id)
      customer.delete
      @card.delete
      redirect_to root_path
    else 
      @card.blank?
      redirect_to action: "new"
    end
  end
  def show
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    order = Payjp::Customer.retrieve(@card.order_id)
    @default_card_information = order.cards.retrieve(@card.card_id)
  end

  def up
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      order = Payjp::Customer.retrieve(card.order_id)
      @default_card_information = order.cards.retrieve(card.card_id)
    end
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first
  end

end
