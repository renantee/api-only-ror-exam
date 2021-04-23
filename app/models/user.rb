class User < ApplicationRecord
  acts_as_paranoid
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password
end
