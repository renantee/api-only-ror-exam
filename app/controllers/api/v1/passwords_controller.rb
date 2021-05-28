class Api::V1::PasswordsController < Api::V1::BaseController
  before_action :authorized

  def update
    @user = User.new(password_params)
    @user.validate

    @errors = @user.errors.messages
    if @errors.empty?
      logged_in_user.update(password_params)
      render_messages_ok
    else
      render_messages_errors
    end
  end

  private

  def password_params
    params.permit(:password, :password_confirmation, :current_password)
          .merge(id: logged_in_user.id)
  end
end
