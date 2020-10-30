FactoryBot.define do
  factory :user do
    password              { '00000000' }
    password_confirmation { '00000000' }
    sequence(:email) { |n| "guest#{n}@example.com"}
  end
end
