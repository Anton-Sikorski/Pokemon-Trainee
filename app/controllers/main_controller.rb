# frozen_string_literal: true

# controller for user model
class MainController < ApplicationController
  def index
    @users = User.all
    @cols = PokeSprite.column_names
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end
end
