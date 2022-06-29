# frozen_string_literal: true

# performance class
class TopFive
  attr_reader :path, :validator, :scanner, :cleaner, :grouper, :sorter, :printer

  def initialize(path, validator, scanner, cleaner, grouper, sorter, printer)
    @path = path
    @validator = validator
    @scanner = scanner
    @cleaner = cleaner
    @grouper = grouper
    @sorter = sorter
    @printer = printer
  end

  def perform
    valid_path = validator.new(path).call
    collected_files = scanner.new(valid_path).call
    extension_names = cleaner.new(collected_files).call
    grouped_data = grouper.new(extension_names).call
    sorted_data = sorter.new(grouped_data).call
    printer.new(sorted_data).call
  end
end
