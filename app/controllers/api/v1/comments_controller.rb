class Api::V1::CommentsController < ApplicationController
  before_action :authorized, except: %i[index]
  before_action :set_commentable
  before_action :set_comment, only: %i[update destroy]

  def index; end

  def create
    if params[:comment][:body].present?
      @comment = @commentable.comments.new comment_params
      @comment.user = User.first
    end
  end

  def update
    @errors = {}
    @errors["body"] = [validation("body")] if validation("body").present?

    if @errors.empty?
      @comment.user = User.first
      @comment.update(comment_params)
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def set_commentable
    @commentable = Post.find_by(slug: params[:post_slug])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def validation(field)
    "The #{field} field is required." if params[field].blank?
  end
end
