class Api::V1::AuthController < Api::V1::BaseController
  before_action :set_errors, only: %i[login]

  def login
    @user = User.find_by(email: params[:email].downcase)

    if @user&.authenticate(params[:password])
      @exp = 24.hours.from_now.to_i
      @token = encode_token({ user_id: @user.id, exp: @exp })
    else
      @errors["email"] = ["These credentials do not match our records."]
      render_messages_errors
    end
  end

  def logout
    token = auth_header.split[1]
    Blacklist.create(token: token)
    render json: { message: "user logged-out successfully" }, status: :ok
  end

  private

  def validation(field)
    "The #{field} field is required." if params[field].blank?
  end

  def set_errors
    @errors = {}
    @errors["email"] = [validation("email")] if validation("email").present?
    @errors["password"] = [validation("password")] if validation("password").present?

    render_messages_errors unless @errors.empty?
  end
end
