class Item < ApplicationRecord
  belongs_to :user

  # 商品画像の追加
  has_one_attached :image

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
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  validates :shipping_cost_id, presence: true
  validates :shipping_day_id, presence: true
  validates :shipping_id, presence: true
  validates :prefecture_id, presence: true

  # 商品の状態が必須であることを設定
  CONDITIONS = ['---', '新品・未使用', '未使用に近い', '目立った傷や汚れなし', 'やや傷や汚れあり', '傷や汚れあり', '全体的に状態が悪い']
  validates :condition, presence: true, inclusion: { in: CONDITIONS }

  # 画像が必須であることを設定
  validates :image, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
