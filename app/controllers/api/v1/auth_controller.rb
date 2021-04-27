class Api::V1::AuthController < Api::V1::BaseController
  def login
    @errors = {}
    @errors["email"] = [validation("email")] if validation("email").present?
    @errors["password"] = [validation("password")] if validation("password").present?

    if @errors.empty?
      @user = User.find_by(email: params[:email].downcase)

      if @user && @user.authenticate(params[:password])
        exp = Time.now.to_i + 24 * 3600
        @token = encode_token({ user_id: @user.id, exp: exp })
      else
        @errors["email"] = ["These credentials do not match our records."]
      end
    end
  end

  def logout
    token = auth_header.split(" ")[1]
    Blacklist.create(token: token)
  end

  private

  def validation(field)
    "The #{field} field is required." if params[field].blank?
  end
end
