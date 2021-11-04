# frozen_string_literal: true

# parent of all controllers
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pagy::Backend
  include Pundit
  # with the use of authorise method, instance of the selected class becomes
  # connected to the appropriate policy. In policy we have rules for each
  # controller action, which determine scope and actions allowed to the user.

  protected

    def configure_permitted_parameters
      attributes = %i[name username email avatar]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

  private

    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referer || root_path)
    end
end
