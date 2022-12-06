class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :users_items

  validates :nickname, presence: true

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # ユーザー本名全角の正規表現
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # ユーザー本名全角の正規表現
  validates :first_name_read, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :last_name_read, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # フリガナ全角の正規表現
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
