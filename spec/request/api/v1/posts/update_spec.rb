require "rails_helper"

RSpec.describe "Posts", type: :request do
  before do
    create(:user) do |user|
      login_user(user)
      @post = user.posts.create(attributes_for(:post))
    end
  end

  describe "POST /api/posts#update" do
    context "When request is valid" do
      before do
        @post_params = { title: "new title", content: "new content" }
        patch api_post_path(@post.slug), params: @post_params.to_json, headers: @headers
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as({
                                              data: {
                                                "id"         => @post.id,
                                                "user_id"    => @post.user_id,
                                                "title"      => @post_params[:title],
                                                "slug"       => "new-title",
                                                "content"    => @post_params[:content],
                                                "created_at" => @post.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "updated_at" => @post.updated_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "deleted_at" => nil
                                              }
                                            })
      end
    end
  end
end
