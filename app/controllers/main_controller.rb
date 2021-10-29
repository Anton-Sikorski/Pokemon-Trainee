# frozen_string_literal: true

# controller for user model
class MainController < ApplicationController
  def index
    @users = User.all

    @users.each do |user|
      unless user.avatar.attached?
        user.avatar.attach(io: File.open("storage/user-images/user-default.jpeg"),
                           filename: "file.pdf")
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
