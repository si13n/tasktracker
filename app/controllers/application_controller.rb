class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :role, :team_id ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role, :email, :avatar, :team_id])
  end

  private
  def init_attachment
    if current_user.update
      current_user.avatar.attach(params[:avatar])
    end
  end
end
