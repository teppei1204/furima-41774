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
  belongs_to_active_hash :shipping

  # 商品名が必須であることを設定
  validates :name, presence: true
  # 商品の説明が必須であることを設定
  validates :description, presence: true
  # 価格が必須であることと、数値の制限を設定
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # カテゴリが必須で、特定の値のみ許可するバリデーションを追加
  CATEGORIES = ['---', 'メンズ', 'レディース', 'ベビー・キッズ', 'インテリア・住まい・小物', '本・音楽・ゲーム', 'おもちゃ・ホビー・グッズ', '家電・スマホ・カメラ', 'スポーツ・レジャー',
                'ハンドメイド', 'その他']
  validates :category_id, presence: true, numericality: { only_integer: true }, inclusion: { in: Category.all.map(&:id) }

  # 配送料の負担が必須であることを設定
  SHIPPING_COSTS = ['---', '着払い(購入者負担)', '送料込み(出品者負担)']
  validates :shipping_cost_id, presence: true, numericality: { only_integer: true }, inclusion: { in: ShippingCost.all.map(&:id) }

  # 発送までの日数が必須であることを設定
  validates :shipping_day_id, presence: true, numericality: { only_integer: true }, inclusion: { in: ShippingDay.all.map(&:id) }
  # 発送元の地域が必須であることを設定
  validates :shipping_id, presence: true, numericality: { only_integer: true }, inclusion: { in: Shipping.all.map(&:id) }
  validates :prefecture_id, presence: true, numericality: { only_integer: true }, inclusion: { in: Prefecture.all.map(&:id) }

  # 商品の状態が必須であることを設定
  CONDITIONS = ['---', '新品・未使用', '未使用に近い', '目立った傷や汚れなし', 'やや傷や汚れあり', '傷や汚れあり', '全体的に状態が悪い']
  validates :condition_id, presence: true, numericality: { only_integer: true }, inclusion: { in: Condition.all.map(&:id) }

  # 画像が必須であることを設定
  validates :image, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
