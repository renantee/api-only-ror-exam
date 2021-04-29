require "rails_helper"

RSpec.describe "Auth", type: :request do
  before do
    @user = create(:user)
    login_user(@user)
  end

  describe "POST /api/logout" do
    before do
      post api_logout_path, headers: @headers
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as({ status: "user logged-out successfully" })
    end
  end
end
