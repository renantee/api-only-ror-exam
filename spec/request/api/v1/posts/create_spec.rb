require "rails_helper"

RSpec.describe "Posts", type: :request do
  before do
    create(:user) do |user|
      @user = user
      @post = user.posts.build(attributes_for(:post, user: user))
    end
  end

  describe "POST /api/posts#create" do
    before do
      post api_posts_path, params: { post: @post }, headers: authenticated_header(@user)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    # it "returns response match to expected json" do
    #   expect(response.body).to be_json_as({
    #                                         data: {
    #                                           "title"      => @post.title,
    #                                           "slug"       => @post.slug,
    #                                           "content"    => @post.content,
    #                                           "created_at" => @post.created_at.strftime("%Y-%m-%d %H:%M:%S"),
    #                                           "updated_at" => @post.updated_at.strftime("%Y-%m-%d %H:%M:%S")
    #                                           "id"         => @post.id,
    #                                           "user_id"    => @post.user_id,
    #                                         }
    #                                       })
    # end
  end
end
