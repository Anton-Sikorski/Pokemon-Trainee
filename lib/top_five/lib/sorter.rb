# frozen_string_literal: true

# groups array data by names and appearance count
class Sorter
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    sort_data
  end

  private

  def sort_data
    data.sort_by { |key, value| -value }.take(5).to_h
  end
end

