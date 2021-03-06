require "rails_helper"

def expected_comment_index(comment)
  {
    data: [{
      "id" => comment.id, "title" => comment.title, "body" => comment.body,
      "commentable_type" => comment.commentable_type, "commentable_id" => comment.commentable_id,
      "creator_id" => comment.user_id, "parent_id" => comment.parent_id,
      "created_at" => comment.created_at.strftime("%Y-%m-%d %H:%M:%S"),
      "updated_at" => comment.updated_at.strftime("%Y-%m-%d %H:%M:%S")
    }]
  }
end

RSpec.describe "Comments", type: :request do
  before do
    create(:user) do |user|
      @post = user.posts.create(attributes_for(:post))
      @comment = @post.comments.create(attributes_for(:comment, user: user))
    end
  end

  describe "GET /api/posts/{post}/comments#index" do
    before do
      get "/api/posts/#{@post.slug}/comments?page=1"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns response match to expected json" do
      expect(response.body).to be_json_as(expected_comment_index(@comment))
    end
  end
end
