class Item < ApplicationRecord
  # has_many :messages
  has_many :messages
  # has_many :likes
  # has_many :flags
  # has_many :message_users,through::messages,source::user
  # has_many :like_users,through::likes,source::user
  has_many :images
  accepts_nested_attributes_for :images
  has_one :order
  # belongs_to :profit
  # belongs_to :prefecture
  # belongs_to :brand
  # belongs_to :condition
  # belongs_to :delivery_charge
  # belongs_to :delivery_date
  # belongs_to :order_status
  # belongs_to :size
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :deriver_charge, presence: true
  validates :area, presence: true
  validates :deriver_date, presence: true
end
