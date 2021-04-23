class Post < ApplicationRecord
  acts_as_paranoid
  after_validation :set_slug, only: %i[create update]
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, :content, presence: true

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
