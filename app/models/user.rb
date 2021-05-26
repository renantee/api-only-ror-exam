class User < ApplicationRecord
  attr_accessor :new_password, :new_password_confirmation, :current_password

  acts_as_paranoid
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

  def validate_password(params)
    new_password_error(params[:password])
    password_confirmation_error(params[:password_confirmation], params[:password])

    if params[:current_password].blank?
      errors.add(:current_password, message: "Current Password can't be blank")
    elsif authenticate(params[:current_password]) == false
      errors.add(:current_password, message: "Current Password is Invalid")
    end
  end

  def new_password_error(password)
    if password.blank?
      errors.add(:new_password, message: "New Password can't be blank")
    elsif password.length < 8
      errors.add(:new_password, message: "New Password is not secure please try again. " \
                 "( Must contain 8 or more characters)")
    end
  end

  def password_confirmation_error(confirm, password)
    if confirm.blank?
      errors.add(:new_password_confirmation, message: "Password Confirmation can't be blank")
    elsif confirm != password && password.length > 7
      errors.add(:new_password_confirmation,
                 message: "New Password and Password Confirmation not match")
    end
  end
end
