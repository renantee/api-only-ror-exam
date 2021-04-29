class Api::V1::BaseController < ApplicationController
  def render_messages_ok
    render "api/v1/messages/ok", format: :json, status: :ok
  end

  def render_messages_errors
    render "api/v1/messages/errors", format: :json, status: :unprocessable_entity
  end
end
