class Api::V1::LogoutController < Api::V1::BaseController
  def create
    token = auth_header.split(" ")[1]
    Blacklist.create(token: token)
  end
end
