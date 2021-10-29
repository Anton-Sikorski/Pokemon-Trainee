# frozen_string_literal: true

# controller for user model
class MainController < ApplicationController
  def index
    @users = User.all
    @users.each(&:default_avatar)
  end

  def show
    @user = User.find(params[:id])
  end
end
