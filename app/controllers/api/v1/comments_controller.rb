class Api::V1::CommentsController < Api::V1::BaseController
  before_action :authorized, except: %i[index]
  before_action :set_commentable
  before_action :set_comment, only: %i[update destroy]
  before_action :set_errors, only: %i[create update]
  before_action :post_not_found, only: %i[index create update]

  def index; end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = logged_in_user
    if @comment.save
      render "create", format: :json, status: :created
    else
      @errors = @post.errors
      render_messages_errors
    end
  end

  def update
    if @comment.blank?
      render_messages_not_found
    else
      unless @comment.update(comment_params)
        @errors = @comment.errors
        render_messages_errors
      end
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = @commentable.comments.find_by(id: params[:id]) if @commentable.present?
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
    return if params[:comment].present?

    @errors = {}
    @errors["body"] = [validation("body")] if validation("body").present?

    render_messages_errors unless @errors.empty?
  end

  def post_not_found
    render_messages_not_found if @commentable.blank?
  end
end
