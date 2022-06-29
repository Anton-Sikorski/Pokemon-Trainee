# frozen_string_literal: true

# collects all files in chosen directory
class Scanner
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def call
    get_files(path).flatten
  end

  private

  def get_files(folder_path)
    folder = Dir.new(folder_path)
    folder.children.map do |f|
      path = "#{folder_path}/#{f}"
      Dir.exist?(path) ? get_files(path) : f
    end
  end
end
