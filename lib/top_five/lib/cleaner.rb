# frozen_string_literal: true

# collects all files in chosen directory
class Cleaner
  attr_reader :files

  def initialize(files)
    @files = files
  end

  def call
    clean_extension_names
  end

  private

  def clean_extension_names
    files.map { |f| extname?(f) ? f : File.extname(f) }.sort
  end

  def extname?(str)
    str[0] == '.'
  end
end

