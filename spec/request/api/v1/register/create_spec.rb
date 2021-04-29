require "rails_helper"

def expected_user
  @new_user = User.last
  {
    data: {
      "name"       => @new_user.name,
      "email"      => @new_user.email,
      "updated_at" => @new_user.updated_at.strftime("%Y-%m-%d %H:%M:%S"),
      "created_at" => @new_user.created_at.strftime("%Y-%m-%d %H:%M:%S"),
      "id"         => @new_user.id
    }
  }
end

def message_invalid_register
  {
    message: "The given data was invalid.",
    errors:  {
      email:    ["The email field is required"],
      password: ["The password field is required"]
    }
  }
end

RSpec.describe "Register", type: :request do
  before do
    @user = build(:user)
    @valid_attributes = attributes_for(:user, password_confirmation: @user.password)
    @invalid_attributes = attributes_for(:user, email: nil, password: nil)
  end

  describe "POST /api/register" do
    context "When request is valid" do
      before do
        post "/api/register", params: { register: @valid_attributes }
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as(expected_user)
      end
    end

    context "When request is invalid" do
      before do
        post "/api/register", params: { register: @invalid_attributes }
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as(message_invalid_register)
      end
    end
  end
end
