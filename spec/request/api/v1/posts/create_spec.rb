require "rails_helper"

def expected_post_create(post)
  {
    data: {
      "title"      => post.title, "content" => post.content, "slug" => post.slug,
      "updated_at" => post.updated_at.strftime("%Y-%m-%d %H:%M:%S"),
      "created_at" => post.created_at.strftime("%Y-%m-%d %H:%M:%S"),
      "id"         => post.id, "user_id" => post.user_id
    }
  }
end

RSpec.describe "Posts", type: :request do
  before do
    create(:user) do |user|
      login_user(user)
      @post = user.posts.build(attributes_for(:post, user: user))
    end
  end

  describe "POST /api/posts#create" do
    before do
      post api_posts_path, params: @post.to_json, headers: @headers
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns response match to expected json" do
      @last_post = Post.last
      expect(response.body).to be_json_as(expected_post_create(@last_post))
    end
  end
end
