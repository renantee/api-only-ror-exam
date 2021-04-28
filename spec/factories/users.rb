FactoryBot.define do
  factory :user do
    name { "My Name " }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { "password" }
  end
end
