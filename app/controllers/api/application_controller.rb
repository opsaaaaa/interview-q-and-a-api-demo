class Api::ApplicationController < ActionController::API
  include TenantAuthenticatable

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found(e)
    render json: { error: e.message }, status: :not_found
  end

  def render_no_content_if_blank obj
    render status: :no_content if obj.blank?
  end
end
