FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '大阪市' }
    address { '北区梅田１−１' }
    building { '難波ビル101' }
    telephone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { '2' }
    item_id { '10' }
  end
end
