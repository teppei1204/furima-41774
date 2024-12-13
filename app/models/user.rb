class User < ApplicationRecord
  # バリデーションの追加
  validates :nick_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :birth_day, presence: true
  validates :read_first, presence: true, format: { with: /\A[ァ-ンヴー]+\z/ }
  validates :read_last, presence: true, format: { with: /\A[ァ-ンヴー]+\z/ }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
