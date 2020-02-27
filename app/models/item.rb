class Item < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user
  belongs_to :category
  has_one :order
  # has_many :likes
  # has_many :message_users,through::messages,source::user
  # has_many :like_users,through::likes,source::user
  # belongs_to :profit
  # belongs_to :prefecture
  # belongs_to :brand
  # belongs_to :condition
  # belongs_to :delivery_charge
  # belongs_to :delivery_date
  # belongs_to :order_status
  # belongs_to :size


  validates :name,:price,:description,:condition,:deriver_charge,:area,:deriver_date,:category_id, presence: true

  def previous
    user.items.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.items.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
end
