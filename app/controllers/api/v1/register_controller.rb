class Api::V1::RegisterController < Api::V1::BaseController
  def create
    @user = User.new(post_params)
  end

  private

  def post_params
    params.require(:register).permit(:name, :email, :password, :password_confirmation)
  end
end
