FactoryBot.define do
  factory :user do
    nickname { "テストユーザー" }
    sequence(:email) {|n| "guest#{n}@example.com" }
    password              { "00000000" }
    password_confirmation { "00000000" }
    admin { false }
  end
end
