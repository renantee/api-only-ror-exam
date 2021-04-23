FactoryBot.define do
  factory :comment do
    title { "MyString" }
    body { "MyText" }
    commentable_id { 1 }
    commentable_type { "MyString" }
    parent_id { 1 }
    user { nil }
  end
end
