require "rails_helper"

RSpec.describe "Auth", type: :request do
  before do
    @user = create(:user)
  end

  describe "POST /api/logout" do
    before do
      post api_logout_path, headers: authenticated_header(@user)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as({ message: "user logged-out successfully" })
    end
  end
end
