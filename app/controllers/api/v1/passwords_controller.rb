class Api::V1::PasswordsController < Api::V1::BaseController
  before_action :authorized

  def update
    @user.validate_password(password_params)
    @errors = @user.errors.messages

    if @errors.empty?
      @user.update(password_params)
      render_messages_ok
    end

    render_messages_errors unless @errors.empty?
  end

  private

  def password_params
    params.permit(:password, :password_confirmation, :current_password)
  end
end
