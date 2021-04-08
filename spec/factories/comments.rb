FactoryBot.define do
  factory :comment do
    title {'テスト'}
    rate {5}
    content {'テスト'}
    association :post
    association :user
  end
end
