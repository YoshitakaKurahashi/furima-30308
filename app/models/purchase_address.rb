Class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :telephone

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities, :address, :telephone
  end

  def save
    Purchase.create(user.id: current_user.id, item_id: params[:item_id])
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address,  building: building, telephone: telephone)
  end
end