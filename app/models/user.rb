class User < ApplicationRecord
  attr_accessor :current_password

  acts_as_paranoid
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

  def validate
    current_password_error
    new_password_error
    password_confirmation_error
  end

  def current_password_error
    if current_password.blank?
      errors.add(:current_password, message: "Current Password can't be blank")
    elsif User.find_by(id: id).authenticate(current_password) == false
      errors.add(:current_password, message: "Current Password is Invalid")
    end
  end

  def new_password_error
    if password.blank?
      errors.add(:password, message: "New Password can't be blank")
    elsif password.length < 8
      errors.add(:password, message: "New Password is not secure please try again. " \
                 "( Must contain 8 or more characters)")
    end
  end

  def password_confirmation_error
    if password_confirmation.blank?
      errors.add(:password_confirmation, message: "Password Confirmation can't be blank")
    elsif password_confirmation != password && password.present?
      errors.add(:password_confirmation,
                 message: "New Password and Password Confirmation not match")
    end
  end
end
