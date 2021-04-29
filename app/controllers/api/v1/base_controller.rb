class Api::V1::BaseController < ApplicationController
  def render_messages_ok
    render "api/v1/messages/ok", format: :json, status: :ok
  end

  def render_messages_errors
    render "api/v1/messages/errors", format: :json, status: :unprocessable_entity
  end

  def render_messages_not_found
    render "api/v1/messages/not_found", format: :json, status: :not_found
  end

  def render_messages_forbidden
    render "api/v1/messages/forbidden", format: :json, status: :forbidden
  end
end
