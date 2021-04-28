class Api::V1::AuthController < Api::V1::BaseController
  before_action :set_errors, only: %i[login]

  def login
    return unless @errors.empty?

    @user = User.find_by(email: params[:email].downcase)

    if @user&.authenticate(params[:password])
      @exp = Time.now.to_i + 24 * 3600
      @token = encode_token({ user_id: @user.id, exp: @exp })
    else
      @errors["email"] = ["These credentials do not match our records."]
    end
  end

  def logout
    token = auth_header.split[1]
    Blacklist.create(token: token)
  end

  private

  def validation(field)
    "The #{field} field is required." if params[field].blank?
  end

  def set_errors
    @errors = {}
    @errors["email"] = [validation("email")] if validation("email").present?
    @errors["password"] = [validation("password")] if validation("password").present?
  end
end
