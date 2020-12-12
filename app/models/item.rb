class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

  validates :item_name, :item_explanation, :price, presence: true
  validates :item_name, length: {maxmum: 40 }
  validates :item_explanation, length: {maxmum: 1000 }
  validates :item_category_id,
            :item_status_id,
            :delivery_fee_id,
            :prefecture_id,
            :delivery_day_id,
            presence: true,
            numericality: { other_than: 1 }
  validates :price, length: {minimum: 300, maxmum: 9999999}, format:{with:VALID_PRICE_REGEX}
end
