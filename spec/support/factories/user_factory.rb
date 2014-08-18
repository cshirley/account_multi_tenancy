FactoryGirl.define do
  factory :user, :class => AccountMultiTenancy::User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end

