class CardForm
  include ActiveModel::Model

  # 購入情報に含まれる属性を定義
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token, :user_id, :item_id

  # バリデーションを追加
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Must be 10 or 11 digits' }
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      card = Card.create(user_id: user_id, item_id: item_id)
      Destination.create(
        post_code: post_code,
        prefecture_id: prefecture_id,
        city: city,
        address: address,
        building_name: building_name,
        phone_number: phone_number,
        card_id: card.id
      )
    end
  end
end
