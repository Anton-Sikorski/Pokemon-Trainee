# frozen_string_literal: true

# pokemon
module ArticleHelper
  def format_time(time)
    time.strftime("%b %d %Y, %l:%M%P")
  end

  def fit_text(text)
    text.length > 500 ? "#{text[0...500]}...." : text
  end
end
