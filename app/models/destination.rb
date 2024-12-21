class Destination < ApplicationRecord
  belongs_to :card

  validates :city, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "only allows 10 to 11 digits" }
  validates :prefecture_id, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "should follow the format XXX-XXXX" }
  validates :address, presence: true
end
