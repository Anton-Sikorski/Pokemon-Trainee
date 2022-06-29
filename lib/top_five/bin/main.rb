# frozen_string_literal: true

require_relative 'dependencies'

def top_five(path)
  TopFive.new(path, Validator, Scanner, Cleaner, Grouper, Sorter, Printer).perform
end
