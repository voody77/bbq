class ApplicationController < ActionController::Base
  include Pundit

  add_flash_types :notice, :error, :success, :alert
  protect_from_forgery with: :exception
  # TODO: Не забыть! Эта строка лечит ошибку verify-csrf-token
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end


  def current_user_can_edit?(model)
    user_signed_in? &&
      (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  private

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end

end
