FactoryBot.define do
  factory :comment do
    title { "MyString" }
    body { "MyText" }
    commentable_id { 1 }
    commentable_type { "Post" }
    parent_id { nil }
    user { nil }
  end
end
