# frozen_string_literal: true

# devise extendable controller
class UserController < ApplicationController
  def upload; end

  private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :avatar, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :password, :avatar, :password_confirmation, :current_password)
    end
end
