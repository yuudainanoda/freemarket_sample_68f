class Item < ApplicationRecord
  # has_many :messages
  # has_many :likes
  # has_many :flags
  # has_many :message_users,through::messages,source::user
  # has_many :like_users,through::likes,source::user
  # has_many :flag_users,through::flags,source::user
  # belongs_to :order
  # belongs_to :profit
  # belongs_to :prefecture
  # belongs_to :brand
  # belongs_to :condition
  # belongs_to :delivery_charge
  # belongs_to :delivery_date
  # belongs_to :order_status
  # belongs_to :size
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validate :name, presence: true
  validate :price, presence: true
  validate :description, presence: true
  validate :category, presence: true
  validate :condition, presence: true
  validate :deriver_charge, presence: true
  validate :area, presence: true
  validate :deriver_date, presence: true

  # #出品時の選択肢項目のデータを記録する「active_hash」を使用するために必要
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :conditon

end
