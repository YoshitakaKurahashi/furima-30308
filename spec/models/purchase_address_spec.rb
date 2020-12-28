require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end
    
    it '全ての値が正しく入力されている場合、保存できる' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空だと保存できない' do
      @purchase_address.postal_code = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと保存できない' do
      @purchase_address.postal_code = "1234567"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択していないと保存できない' do
      @purchase_address.prefecture_id = "1"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できない' do
      @purchase_address.municipalities = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it '番地が空だと保存できない' do
      @purchase_address.address = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end
    it '建物名が空でも保存できる' do
      @purchase_address.building = ""
      expect(@purchase_address).to be_valid
    end
    it '電話番号が空だと保存できない' do
      @purchase_address.telephone = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
    end
    it '電話番号にハイフンが入っていると保存できない' do
      @purchase_address.telephone = "123-456-789"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
    end
    it '電話番号が11桁を超えると保存できない' do
      @purchase_address.telephone = "123456789012"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
    end
    it 'トークンが空では保存できない' do
      @purchase_address.token = ""
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    # it '' do
    # end
    # it '' do
    # end
    # it '' do
    # end
    # it '' do
    # end
    # it '' do
    # end
    # it '' do
    # end
  end
end


