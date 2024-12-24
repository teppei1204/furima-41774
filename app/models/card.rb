class Card < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :destination

  # attr_accessor :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  # validates :token, presence: true
end
