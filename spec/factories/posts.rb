FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test.jpg")) }
    title { "テスト" }
    price { 49_478 }
    text { "テスト" }
    association :user
    association :category
  end
end
