class StreetAddress < ApplicationRecord
  
  validates :prefecture,:city,:address,:zipcode,  presence: true
  has_many :items
  has_many :orders
  belongs_to :user
  validates :user_id

end
