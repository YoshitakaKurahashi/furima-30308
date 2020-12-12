class Item < ApplicationRecord
  
  VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze

  validates :item_name, :item_explanation, :price, presence: true
  validates :item_name, length: {maximum: 40 }
  validates :item_explanation, length: {maximum: 1000 }
  validates :item_category_id,
            :item_status_id,
            :delivery_fee_id,
            :prefecture_id,
            :delivery_day_id,
            :user_id,
            presence: true,
            numericality: { other_than: 1 }
  validates :price,
            # numericality:(greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999), 
            format: {with:VALID_PRICE_REGEX}

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day
end
