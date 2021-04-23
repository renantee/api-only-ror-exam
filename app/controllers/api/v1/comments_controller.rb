class Api::V1::CommentsController < ApplicationController
  before_action :set_commentable

  def index; end

  def create
    if params[:comment][:body].present?
      @comment = @commentable.comments.new comment_params
      @comment.user = User.first
    end
  end

  private

  def set_commentable
    @commentable = Post.find_by(slug: params[:post_slug])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
