class User < ApplicationRecord
  # バリデーションの追加
  validates :nick_name, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龥々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龥々]+\z/ }
  validates :birth_day, presence: true
  validates :read_first, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :read_last, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # カスタムバリデーションの追加
  validate :password_complexity

  private

  def password_complexity
    return if password.nil? || password.match(/^(?=.*[a-zA-Z])(?=.*\d).{6,}$/)

    errors.add :password, 'must include at least one letter and one digit'
  end
end
