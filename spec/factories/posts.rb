FactoryBot.define do
  factory :post do
    title { "Post title" }
    slug { "post-title" }
    content { "Post content" }
    user { nil }
  end
end
