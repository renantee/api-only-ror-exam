class Post < ApplicationRecord
  after_validation :set_slug, only: %i[create]
  belongs_to :user
  validates :title, :content, presence: true

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
