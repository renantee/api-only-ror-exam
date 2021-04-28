require "rails_helper"

RSpec.describe "Posts", type: :request do
  before do
    create(:user) do |user|
      @post = user.posts.create(attributes_for(:post))
    end
  end

  describe "GET /api/posts#show" do
    before do
      get "/api/posts/#{@post.slug}"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as({
                                            data: {
                                              "id"         => @post.id,
                                              "user_id"    => @post.user_id,
                                              "title"      => @post.title,
                                              "slug"       => @post.slug,
                                              "image"      => @post.image,
                                              "content"    => @post.content,
                                              "created_at" => @post.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                                              "updated_at" => @post.updated_at.strftime("%Y-%m-%d %H:%M:%S")
                                            }
                                          })
    end
  end
end
