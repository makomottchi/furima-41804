FactoryBot.define do
  factory :user do
    nickname             { 'test_user' }
    email                { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name          { '山田' }
    first_name           { '太郎' }
    family_name_kana     { 'ヤマダ' }
    first_name_kana      { 'タロウ' }
    birth_day            { '1990-01-01' }
  end
end
