class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :body, presence: true
end
