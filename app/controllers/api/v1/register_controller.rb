class Api::V1::RegisterController < Api::V1::BaseController
  def create
    if params[:register].present?
      @user = User.new(register_params)
      unless @user.save
        @errors = @user.errors
        render_messages_errors
      end
    else
      render_errors
    end
  end

  private

  def register_params
    params.require(:register).permit(:name, :email, :password, :password_confirmation)
  end

  def validation(field)
    "The #{field} field is required."
  end

  def render_errors
    @errors = {}
    @errors["name"] = [validation("name")]
    @errors["email"] = [validation("email")]

    render_messages_errors unless @errors.empty?
  end
end
