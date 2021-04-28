require "rails_helper"

RSpec.describe "Posts", type: :request do
  before do
    create(:user) do |user|
      @post = user.posts.create(attributes_for(:post))
    end
  end

  describe "GET /api/posts#index" do
    before do
      get "/api/posts?page=1"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as({
                                            data:  [
                                              {
                                                "id"         => @post.id,
                                                "user_id"    => @post.user_id,
                                                "title"      => @post.title,
                                                "slug"       => @post.slug,
                                                "image"      => @post.image,
                                                "content"    => @post.content,
                                                "created_at" => @post.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "updated_at" => @post.updated_at.strftime("%Y-%m-%d %H:%M:%S")
                                              }
                                            ],
                                            links: {
                                              first: "http://127.0.0.1:8000/api/posts?page=1",
                                              last:  "http://127.0.0.1:8000/api/posts?page=1",
                                              prev:  nil,
                                              next:  nil
                                            },
                                            meta:  {
                                              current_page: 1,
                                              from:         1,
                                              last_page:    1,
                                              path:         "http://127.0.0.1:8000/api/posts",
                                              per_page:     15,
                                              to:           1,
                                              total:        1
                                            }
                                          })
    end
  end
end
