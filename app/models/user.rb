class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :nickname, presence: true
  validates :password, format:{with:VALID_PASSWORD_REGEX}
  validates :first_name, presence: true, format:{with:VALID_NAME_REGEX}
  validates :last_name, presence: true, format:{with:VALID_NAME_REGEX}
  validates :first_kana, presence: true, format:{with:VALID_KANA_REGEX}
  validates :last_kana, presence: true, format:{with:VALID_KANA_REGEX}
  validates :birthday, presence: true
  # has_many: items
  # has_many: purchases
end
