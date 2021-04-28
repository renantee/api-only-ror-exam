require "rails_helper"

def authenticated_header
  token = Knock::AuthToken.new(payload: { sub: @user.id }).token

  {
    Authorization: "Bearer #{token}"
  }
end

RSpec.describe "Auth", type: :request do
  before do
    @user = create(:user)
  end

  describe "POST /api/logout" do
    before do
      post api_logout_path, headers: authenticated_header
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as({ message: "user logged-out successfully" })
    end
  end
end
