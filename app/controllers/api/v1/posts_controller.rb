class Api::V1::PostsController < Api::V1::BaseController
  api :GET, "/posts", "Posts List"
  def index
    render json: { result: [{ name: "post 1" }] }, status: :ok
  end
end
