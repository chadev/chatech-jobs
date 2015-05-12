FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "test-#{i}@chadev.com" }
    password 'password123'
    admin false
  end
end
