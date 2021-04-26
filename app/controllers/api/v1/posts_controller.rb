class Api::V1::PostsController < Api::V1::BaseController
  before_action :authorized, except: %i[index show]
  before_action :set_post, only: %i[show update destroy]

  api :GET, "/posts", "Posts List"
  def index
    @posts = Post.all
  end

  api :GET, "/posts/{post}", "Show Post"
  def show; end

  api :POST, "/posts", "Create Post"
  def create
    @post = Post.new(post_params)
    @post.user = User.first
  end

  api :PATCH, "/posts/{post}", "Update Post"
  def update
    @post.update(post_params)
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
end
