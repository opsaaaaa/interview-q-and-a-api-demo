class Api::ApplicationController < ActionController::API
  include TenantAuthenticatable

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found(e)
    render json: { error: e.message }, status: :not_found
  end

end
