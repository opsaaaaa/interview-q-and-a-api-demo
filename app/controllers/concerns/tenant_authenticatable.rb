module TenantAuthenticatable
  extend ActiveSupport::Concern
 
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods
 
  attr_reader :current_tenant
 
  # Use this to raise an error and automatically respond with a 401 HTTP status
  # code when API key authentication fails
  def authenticate_with_api_key!
    @current_tenant = authenticate_or_request_with_http_token &method(:authenticator)
  end
 
  # Use this for optional API key authentication
  def authenticate_with_api_key
    @current_tenant = authenticate_with_http_token &method(:authenticator)
  end

  def increment_tenant_request_count
    @current_tenant&.request_count += 1
    @current_tenant&.save!
  end

  private
 
  attr_writer :current_tenant
 
  def authenticator(http_token, options)
    @current_tenant = Tenant.find_by api_key: http_token
  end
end