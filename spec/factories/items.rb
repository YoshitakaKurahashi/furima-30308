FactoryBot.define do
  factory :item do
    item_name         { Faker::Device.model_name }
    item_explanation  { Faker::Lorem.sentence }
    item_category_id  { Faker::Number.between(from: 2, to: 11) }
    item_status_id    { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id   { Faker::Number.between(from: 2, to: 4) }
    price             { 25_000 }
    association :user
    # 上記は「users.rb」のFactoryBotとアソシエーションがあることを意味する。
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
