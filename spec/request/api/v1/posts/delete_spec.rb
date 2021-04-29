require "rails_helper"

RSpec.describe "Posts", type: :request do
  before do
    create(:user) do |user|
      login_user(user)
      @post = user.posts.create(attributes_for(:post))
    end
  end

  describe "POST /api/posts#destroy" do
    context "When request is valid" do
      before do
        delete api_post_path(@post.slug), headers: @headers
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as({ status: "record deleted successfully" })
      end
    end
  end
end
