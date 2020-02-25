FactoryBot.define do
  factory :user do
    name { "Friend_#{rand(999)}" }
    sequence(:email) { |n| "mail_#{n}@bbq.org" }
    after(:build) { |u| u.password_confirmation = u.password = "123456" }
  end
end