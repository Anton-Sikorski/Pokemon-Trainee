# frozen_string_literal: true

# pokemon
module ArticleHelper
  def format_time(time)
    time.strftime("%b %d %Y, %l:%M%P")
  end
end
