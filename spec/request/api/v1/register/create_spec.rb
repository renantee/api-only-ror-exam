require "rails_helper"

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

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns response match to expected json" do
        @new_user = User.last
        expect(response.body).to be_json_as({
                                              data: {
                                                "name"       => @new_user.name,
                                                "email"      => @new_user.email,
                                                "updated_at" => @new_user.updated_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "created_at" => @new_user.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "id"         => @new_user.id
                                              }
                                            })
      end
    end

    context "When request is invalid" do
      before do
        post "/api/register", params: { register: @invalid_attributes }
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as({ message: "The given data was invalid.",
                                              errors:  {
                                                email:    [
                                                  "The email field is required"
                                                ],
                                                password: [
                                                  "The password field is required"
                                                ]
                                              } })
      end
    end
  end
end
