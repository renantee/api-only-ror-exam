class Api::V1::PostsController < Api::V1::BaseController
  before_action :authorized, except: %i[index show]
  before_action :set_post, only: %i[show update destroy]
  before_action :upload_image, only: %i[create]

  api :GET, "/posts", "Posts List"
  def index
    @posts = Post.all
  end

  api :GET, "/posts/{post}", "Show Post"
  def show; end

  api :POST, "/posts", "Create Post"
  def create
    @post = Post.new(post_params)
    @post.user = logged_in_user
    @post.image = upload_image["url"] if upload_image["url"].present?
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

  def upload_image
    Cloudinary::Uploader.upload(params[:post][:image])
  end
end
