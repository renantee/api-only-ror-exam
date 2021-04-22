class Api::V1::PostsController < Api::V1::BaseController
  before_action :set_post, only: %i[show]

  api :GET, "/posts", "Posts List"
  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  api :GET, "/posts/{post}", "Show Post"
  def show
    render json: @post
  end

  private

  def set_post
    @post = Post.find_by(slug: params[:slug])
  end
end
