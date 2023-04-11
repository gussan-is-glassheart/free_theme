class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    render template: 'errors/404', status: :not_found
  end

  add_flash_types :success, :error
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, error: t('defaults.please_login')
  end

  def require_not_logged_in
    redirect_to theme_boards_path, error: t('defaults.invalid_access') if logged_in?
  end
end
