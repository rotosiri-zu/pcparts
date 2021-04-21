FactoryBot.define do
  factory :post do
    image_url { "https://image.sofmap.com/images/product/other/0735858392426_0.jpg?v=20012201" }
    title { "テスト" }
    price { 49_478 }
    text { "テスト" }
    association :user
    association :category
  end
end
