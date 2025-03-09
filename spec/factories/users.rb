FactoryBot.define do
  factory :user do
    nickname             { 'test_user' }
    email                { Faker::Internet.unique.email }
    password { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name          { '山田' }
    first_name           { '太郎' }
    family_name_kana     { 'ヤマダ' }
    first_name_kana      { 'タロウ' }
    birth_day            { '1990-01-01' }
  end
end
