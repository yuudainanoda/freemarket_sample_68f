class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many   :items
  has_many   :orders
  has_many   :profits
  has_many   :points
  has_many   :messages
  has_many   :likes
  has_many   :flags
  has_many   :message_items,through::messages,source::item
  has_many   :like_items,through::likes,source::item
  has_many   :flag_items,through::flags,source::item
  belongs_to :prefecture
  belongs_to :rate

  validates  :nickname,:password,:birth_year,:birth_month,:birth_day,:telephone,presence: true
   # メールの正規表現
  validates :email, presence: true, length: { maximum: 255 },uniqueness: true
  # format: { with: /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/}
  # gem 'email_validator', '~> 1.6'を追加予定２・１６
  validates :first_name_kana,:last_name_kana, presence: true,
  format: { with: /^([ァ-ン]|ー)+$/}
  validates :first_name,:last_name, presence: true,
  format: { with:/\A[ぁ-んァ-ン一-龥]/}
end
