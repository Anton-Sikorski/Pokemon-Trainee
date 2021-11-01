# frozen_string_literal: true

# pokemon
module CommentHelper
  def format_creation_time(creation_time)
    time_diff = ((Time.zone.now - creation_time) / 60).round(0)
    case time_diff
    when 0
      "Right now"
    when 1..60
      "#{(time_diff).round(0)} minutes ago"
    when 61..1440
      "#{(time_diff / 60).round(0)} hours ago"
    else
      "#{(time_diff / 1440).round(0)} days ago"
    end
  end
end
