class Item < ApplicationRecord
  belongs_to :user

  # 商品画像の追加
  has_one_attached :image

  # ActiveHashに関連付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  # 商品名が必須であることを設定
  validates :name, presence: true
  # 商品の説明が必須であることを設定
  validates :description, presence: true
  # 価格が必須であることと、数値の制限を設定
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # カテゴリが必須で、特定の値のみ許可するバリデーションを追加
  validates :category_id, presence: true, numericality: { other_than: 1, message: "is not included in the list" }

  # 配送料の負担が必須であることを設定
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "is not included in the list" }

  # 発送までの日数が必須であることを設定
  validates :shipping_day_id, presence: true, numericality: { other_than: 1, message: "is not included in the list" }
  # 発送元の地域が必須であることを設定
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "is not included in the list" }

  # 商品の状態が必須であることを設定
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "is not included in the list" }

  # 画像が必須であることを設定
  validates :image, presence: true
end
