class Api::V1::PostsController < Api::V1::BaseController
  before_action :authorized, except: %i[index show]
  before_action :set_post, only: %i[show update destroy]
  before_action :set_page, only: %i[index]

  api :GET, "/posts", "Posts List"
  def index
    @posts = Post.page(@page).order(created_at: :desc)
    @path = "http://127.0.0.1:8000#{request.path}"
    @from = (@page.to_i - 1) * @posts.limit_value + 1
    @to = @from + @posts.count - 1
  end

  api :GET, "/posts/{post}", "Show Post"
  def show; end

  api :POST, "/posts", "Create Post"
  def create
    @post = Post.new(post_params)
    @post.user = logged_in_user
  end

  api :PATCH, "/posts/{post}", "Update Post"
  def update
    @post.update(post_params) if @post.present?
  end

  api :DELETE, "/posts/{post}", "Delete Post"
  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find_by(slug: params[:slug])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end

  def set_page
    @page = params[:page] || 0
  end
end
