FactoryBot.define do
  factory :post do
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    title {'テスト'}
    price {49478}
    text {'テスト'}
    association :category
    association :user
  end
end
