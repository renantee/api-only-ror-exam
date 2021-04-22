FactoryBot.define do
  factory :post do
    title { "MyString" }
    slug { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
