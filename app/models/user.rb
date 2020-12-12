class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  
  validates :password, format:{with:VALID_PASSWORD_REGEX}
  with_options presence: true do
    with_options format:{with:VALID_NAME_REGEX} do
      validates :first_name
      validates :last_name
    end
    with_options format:{with:VALID_KANA_REGEX} do
      validates :first_kana
      validates :last_kana
    end
    validates :birthday
  end

  has_many :items
  # has_many :purchases
end