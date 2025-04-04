class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters only' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters only' }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters only' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, message: 'Full-width katakana characters only' }
  validates :birth_day, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
