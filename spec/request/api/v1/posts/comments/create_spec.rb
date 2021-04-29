require "rails_helper"

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
        expect(response.body).to be_json_as({
                                              data: {
                                                "body"             => @last_comment.body,
                                                "commentable_type" => @last_comment.commentable_type,
                                                "commentable_id"   => @last_comment.commentable_id,
                                                "creator_id"       => @last_comment.user_id,
                                                "parent_id"        => @last_comment.parent_id,
                                                "created_at"       => @last_comment.created_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "updated_at"       => @last_comment.updated_at.strftime("%Y-%m-%d %H:%M:%S"),
                                                "id"               => @last_comment.id
                                              }
                                            })
      end
    end
  end
end
