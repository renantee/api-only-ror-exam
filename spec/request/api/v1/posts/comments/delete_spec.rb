require "rails_helper"

RSpec.describe "Comments", type: :request do
  before do
    create(:user) do |user|
      login_user(user)
      @post = user.posts.create(attributes_for(:post, user: user))
      @comment = @post.comments.create(attributes_for(:comment, user: user))
    end
  end

  describe "POST /api/posts/{post}/comments#destroy" do
    context "When request is valid" do
      before do
        delete api_post_comment_path(@post.slug, @comment.id), headers: @headers
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
