FactoryBot.define do
  factory :user do
    password              { '00000000' }
    password_confirmation { '00000000' }
    sequence(:email) {'guest@example.com'}
  end
end
