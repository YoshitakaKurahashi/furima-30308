class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :telephone, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, :address
    validates :telephone, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    # user = User.create(
    #   # user: current_user
    #   nickname: nickname,
    #   email: email,
    #   encrypted_password: encrypted_password,
    #   first_name: first_name,
    #   last_name: last_name,
    #   first_kana: first_kana,
    #   last_kana: last_kana,
    #   birthday: birthday
    # )
    # item = Item.create(
    #   item_name: item_name,
    #   item_explanation: item_explanation,
    #   item_category_id: item_category_id,
    #   item_status_id: item_status_id,
    #   delivery_fee_id: delivery_fee_id,
    #   prefecture_id: prefecture_id,
    #   delivery_day_id: delivery_day_id,  
    #   price: price
    # )
    # user = User.find(current_user)
    # Purchase.create(user_id: user_id, item_id: item_id)
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities,
      address: address,
      building: building,
      telephone: telephone,
      purchase_id: purchase.id
    )
  end
end