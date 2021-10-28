# frozen_string_literal: true

# controller for user model
class MainController < ApplicationController
  def index
    @users = User.all
    @cols = Comment.column_names
    @count = Article.count
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @user = current_user
  end
end
