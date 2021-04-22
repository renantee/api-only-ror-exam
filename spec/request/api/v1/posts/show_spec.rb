require "rails_helper"

RSpec.describe "Show a post", type: :request do
  describe "GET #show" do
    before do
      get "/api/posts#show"
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
