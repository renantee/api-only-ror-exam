RSpec.shared_context "valid" do
  context "with valid raw data" do
    before do
      @params = { password:              "newpassword",
                  password_confirmation: "newpassword",
                  current_password:      @user.password }
      patch api_change_password_path, params: @params.to_json, headers: @headers
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as({ status: "password updated successfully" })
    end
  end
end

RSpec.shared_context "invalid current password" do
  context "with invalid current password" do
    before do
      @params = { password:              "newpassword",
                  password_confirmation: "newpassword",
                  current_password:      "wrongpassword" }
      patch api_change_password_path, params: @params.to_json, headers: @headers
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as(invalid_current_password)
    end
  end
end

RSpec.shared_context "fields cannot be blank" do
  context "with empty fields" do
    before do
      @params = { password:              nil,
                  password_confirmation: nil,
                  current_password:      nil }
      patch api_change_password_path, params: @params.to_json, headers: @headers
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as(fields_cannot_be_blank)
    end
  end
end

def invalid_current_password
  {
    message: "The given data was invalid.",
    errors:  { current_password: ["Current Password is Invalid"] }
  }
end

def fields_cannot_be_blank
  {
    message: "The given data was invalid.",
    errors:  { password:              ["New Password can't be blank"],
               password_confirmation: ["Password Confirmation can't be blank"],
               current_password:      ["Current Password can't be blank"] }
  }
end
