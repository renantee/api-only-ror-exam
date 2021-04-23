class Api::V1::CommentsController < ApplicationController
  before_action :set_commentable

  def index; end

  private

  def set_commentable
    @commentable = Post.find_by(slug: params[:post_slug])
  end
end
