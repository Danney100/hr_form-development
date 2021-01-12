FactoryBot.define do
  factory :account_user do

    association :account
    association :user

    user_role { "standard" }

  end
end
