require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '商品出品情報が保存できる場合' do
      it '商品情報が全て埋まっていれば保存できる' do
        expect(@item).to be_valid
      end
      it '販売価格が半角英数字の場合、保存できる' do
        @item.price = 1200
        expect(@item).to be_valid
      end
      it '販売価格が300円以上9,999,999円以下の場合、保存できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '画像が入っていると保存できる' do
        expect(@item.image).to be_valid
      end
    end

    context '商品出品情報が保存できない場合' do
      it '画像が入っていない場合、保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が入っていない場合、保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が入っていない場合、保存できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it '商品詳細（カテゴリー）を選択していないと保存できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item category must be other than 1')
      end
      it '商品詳細（商品の状態）を選択していないと保存できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料の負担が選択されていないと保存できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域が選択されていないと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が選択されていないと保存できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end
      it '販売価格が入力されていないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が半角数字出ないと保存できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '販売価格が300円以上でないと保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が9,999,999円以下でないと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
