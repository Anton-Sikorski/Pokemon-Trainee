# frozen_string_literal: true

# controller for user model
class MainController < ApplicationController
  def index
    super
    @users = User.all
  end

  def show
    super
    @user = User.find(params[:id])
  end
end
