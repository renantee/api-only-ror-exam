class Api::V1::PostsController < Api::V1::BaseController

  api :GET, '/post?page=:page'
  param :page, :number, desc: 'set current page'
  def index
    render json: { result: [] }
  end

end
