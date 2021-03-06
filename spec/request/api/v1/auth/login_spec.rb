require "rails_helper"

def expected_token
  {
    token:      /^.*/,
    token_type: "bearer",
    expires_at: /^\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d/
  }
end

def message_invalid_credentials
  {
    message: "The given data was invalid.",
    errors:  {
      email: [
        "These credentials do not match our records."
      ]
    }
  }
end

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

      it "returns response match to expected json" do
        expect(response.body).to be_json_as(expected_token)
      end
    end

    # returns failure message when request is invalid
    context "When request is invalid" do
      before do
        post api_login_path, params: @invalid_credentials
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as(message_invalid_credentials)
      end
    end
  end
end
