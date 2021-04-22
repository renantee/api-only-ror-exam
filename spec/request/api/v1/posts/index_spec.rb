require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    before do
      get "/api/posts#index"
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    # it "JSON body response contains expected post attributes" do
    #   json_response = JSON.parse(response.body)
    #   expect(json_response).to match_array(%i[id title slug content user_id created_at updated_at])
    # end
  end
end
