class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authorized, except: %i[index]
  before_action :set_commentable
  before_action :set_comment, only: %i[update destroy]
  before_action :set_errors, only: %i[create update]

  def index
    render_messages_not_found unless @commentable
  end

  def create
    return unless @errors.empty? && @commentable

    @comment = @commentable.comments.new comment_params
    @comment.user = logged_in_user
    @comment.save
  end

  def update
    return unless @errors.empty?

    @comment.user = logged_in_user
    @comment.update(comment_params)
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

  def set_errors
    @errors = {}
    @errors["body"] = [validation("body")] if validation("body").present?
  end
end
