class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_message_counts
  before_action :configure_permitted_parameters, if: :devise_controller?

  def redirect_path
    @redirect_path ||= params[:redirect] || request.fullpath
  end
  helper_method :redirect_path

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :invitation_code
  end

  def load_message_counts
    @message_counts = Message.order(:week).select('week, count(*) qty').group(:week)
  end

  def after_sign_in_path_for(resource)
    params[:redirect] || super
  end

  def login_required
    unless user_signed_in?
      redirect_to new_user_session_path(redirect: redirect_path)
    end
  end
end
