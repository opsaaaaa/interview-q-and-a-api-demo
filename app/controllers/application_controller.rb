class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found(e)
    render json: { error: e.message }, status: :not_found
  end

  def render_bad_api_key
    render json: { error: e.message }, status: :not_found
  end

  def render_missing_api_key
    render json: { error: e.message }, status: :not_found
  end
  
  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @tenant = Tenant.find_by(api_key: token)
    end
  end
end
