FactoryBot.define do
  factory :product do
    name { "テスト商品" }
    description { "これはテスト商品の説明です。" }
    category_id { 2 } # メンズなどの適切なカテゴリIDを設定
    status_id { 2 } # 新品・未使用などの適切な状態IDを設定
    shipping_cost_id { 2 } # 着払いなどの適切な配送費負担IDを設定
    prefecture_id { 2 } # 北海道などの適切な都道府県IDを設定
    shipping_day_id { 2 } # 1~2日で発送などの適切な発送日数IDを設定
    price { 500 }
    association :user # 商品を持っているユーザーを設定


    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
