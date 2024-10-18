class ApplicationController < ActionController::Base
  before_action :set_current_tenant

  private

  def set_current_tenant
    @current_tenant = Tenant.find_by(subdomain: request.subdomain) || Tenant.first
    # if @current_tenant.nil?
    #   redirect_to tenants_root_url, alert: 'Tenant not found' # Use tenants_root_url
    # end
  end
end
