class StreetAddress < ApplicationRecord
  has_many :items
  has_many :orders
  belongs_to :user,  inverse_of: :street_address, optional: true

  validates :prefecture,:city,:address,:zipcode,  presence: true
end
