FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    id                    { '4' }
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_kana            { person.first.katakana }
    last_kana             { person.last.katakana }
    birthday              { Faker::Date.birthday(min_age: 50, max_age: 65) }
  end
end
