# frozen_string_literal: true

# collects all files in chosen directory
class Printer
  attr_reader :data, :max_size

  def initialize(data)
    @data = data
    @max_size = 0
  end

  def call
    define_max_size
    show_data
  end

  private

  def define_max_size
    data.each_key { |k| @max_size = k.size if k.size > max_size }
  end

  def show_data
    data.each_pair { |e, c| printf "%-#{max_size}s %s\n", e, c }
  end
end

