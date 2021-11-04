# frozen_string_literal: true

# controller for user model
class MainController < ApplicationController
  def index
    @cols = User.column_names
    @time = time { @users = User.all } # loads each attachment separately. don't know howto fix it.
    # includes avatar_attachment doesn't make any difference. with_image_attachment either
  end

  def show
    @user = User.find(params[:id])
  end

  private

    # calculates time of data load
    def time
      start = Time.zone.now
      yield
      (Time.zone.now - start) * 1000
    end
end
