require "rails_helper"
require_relative "shared_context"

RSpec.describe "PasswordsController", type: :request do
  before do
    @user = create(:user)
    login_user(@user)
  end

  describe "PATCH /api/change-password" do
    include_context "valid"
    include_context "invalid current password"
    include_context "fields cannot be blank"
  end
end
