FactoryBot.define do
  factory :event do
    title { "TestParty_#{rand(999)}" }
    description { 'testtesttest' }
    address { 'Москва, Кремль' }
    datetime { DateTime.current }
    created_at { Time.current }
    pincode { 123 }
    association :user
  end
end