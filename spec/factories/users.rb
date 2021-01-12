FactoryBot.define do
  factory :user do

    sequence(:email) { |n| "user_#{n}@example.com" }
    password { "password" }

    trait :with_account do
      association :account_user
    end

  end
end
