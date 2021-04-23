class User < ApplicationRecord
  acts_as_paranoid
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
end
