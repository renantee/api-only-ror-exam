class Api::V1::LoginController < Api::V1::BaseController
  def create
    @errors = {}
    @errors["email"] = [validation("email")] if validation("email").present?
    @errors["password"] = [validation("password")] if validation("password").present?

    if @errors.empty?
      @user = User.find_by(email: params[:login][:email].downcase)

      if @user && @user.authenticate(params[:login][:password])
        @token = encode_token({ user_id: @user.id })
      else
        @errors["email"] = ["These credentials do not match our records."]
      end
    end
  end

  def validation(field)
    "The #{field} field is required." if params[:login][field].blank?
  end
end
