# frozen_string_literal: true

# groups array data by names and appearance count
class Grouper
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    group_data
  end

  private

    def group_data
      hash = {}
      hash.default = 0
      data.each { |item| item.empty? ? nil : hash[item] += 1 }
      hash
    end
end
