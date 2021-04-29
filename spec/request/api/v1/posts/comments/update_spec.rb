require "rails_helper"

def expected_comment_update(comment, comment_params)
  {
    data: {
      "id" => comment.id, "title" => comment.title, "body" => comment_params[:body],
      "commentable_type" => comment.commentable_type, "commentable_id" => comment.commentable_id,
      "creator_id" => comment.user_id, "parent_id" => comment.parent_id,
      "created_at" => comment.created_at.strftime("%Y-%m-%d %H:%M:%S"),
      "updated_at" => comment.updated_at.strftime("%Y-%m-%d %H:%M:%S")
    }
  }
end

RSpec.describe "Comments", type: :request do
  before do
    create(:user) do |user|
      login_user(user)
      @post = user.posts.create(attributes_for(:post, user: user))
      @comment = @post.comments.create(attributes_for(:comment, user: user))
    end
  end

  describe "POST /api/posts/{post}/comments#update" do
    context "When request is valid" do
      before do
        @comment_params = { body: "new body" }
        patch api_post_comment_path(@post.slug, @comment.id), params:  @comment_params.to_json,
                                                              headers: @headers
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns response match to expected json" do
        expect(response.body).to be_json_as(expected_comment_update(@comment, @comment_params))
      end
    end
  end
end
