class Item < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :description, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_day_id, presence: true
  validates :shipping_id, presence: true
  validates :prefecture_id, presence: true
  validates :condition_id, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
