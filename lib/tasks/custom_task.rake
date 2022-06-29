require_relative '../top_five/bin/main'

namespace :custom_command do
  desc "Operates custom tasks"

  task :top_five, [:folder_path] do |t, args|
    top_five(args[:folder_path])
  end
end
