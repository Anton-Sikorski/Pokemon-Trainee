# frozen_string_literal: true

# protect app from running if directory doesn't exist
class Validator
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def call
    exist?
  end

  private

  def exist?
    if Dir.exist?(path)
      folder_name = path.split('/').last
      puts "Top 5 file formats in #{folder_name} folder:"
      path
    else
      puts "This folder doesn't exist!"
      exit
    end
  end
end
