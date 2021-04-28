require "rails_helper"

RSpec.describe "Auth", type: :request do
  before do
    create(:user) do |user|
      @valid_credentials = { email: user.email, password: user.password }
      @invalid_credentials = { email: user.email, password: "wrongpassword" }
    end
  end

  describe "POST /api/login" do
    # returns auth token when request is valid
    context "When request is valid" do
      before do
        post api_login_path, params: @valid_credentials
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as({ token:      /^.*/,
                                              token_type: "bearer",
                                              expires_at: /^\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d/ })
      end
    end

    # returns failure message when request is invalid
    context "When request is invalid" do
      before do
        post api_login_path, params: @invalid_credentials
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as({ message: "The given data was invalid.",
                                              errors:  {
                                                email: [
                                                  "These credentials do not match our records."
                                                ]
                                              } })
      end
    end
  end
end
