class Api::V1::PostsController < Api::V1::BaseController
  api :GET, "/posts", "Posts List"
  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end
end
