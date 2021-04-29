require "rails_helper"

def expected_comment(comment)
  {
    data: {
      "body" => comment.body, "commentable_type" => comment.commentable_type,
      "commentable_id" => comment.commentable_id, "creator_id" => comment.user_id,
      "parent_id" => comment.parent_id,
      "created_at" => comment.created_at.strftime("%Y-%m-%d %H:%M:%S"),
      "updated_at" => comment.updated_at.strftime("%Y-%m-%d %H:%M:%S"), "id" => comment.id
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

  describe "POST /api/posts/{post}/comments#create" do
    context "When request is valid" do
      before do
        post "/api/posts/#{@post.slug}/comments", params: @comment.to_json, headers: @headers
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "returns response match to expected json" do
        @last_comment = Comment.last
        expect(response.body).to be_json_as(expected_comment(@last_comment))
      end
    end
  end
end
