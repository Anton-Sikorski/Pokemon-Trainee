# frozen_string_literal: true

# pokemon
module ArticleHelper
  def format_time(time)
    time.strftime("%b %d %Y, %l:%M%P")
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
