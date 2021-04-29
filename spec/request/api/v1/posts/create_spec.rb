require "rails_helper"

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
      expect(response.body).to be_json_as({
                                            data: {
                                              "title"      => @last_post.title,
                                              "content"    => @last_post.content,
                                              "slug"       => @last_post.slug,
                                              "updated_at" => @last_post.updated_at.strftime("%Y-%m-%d %H:%M:%S"),
                                              "created_at" => @last_post.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                                              "id"         => @last_post.id,
                                              "user_id"    => @last_post.user_id
                                            }
                                          })
    end
  end
end
