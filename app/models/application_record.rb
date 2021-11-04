# frozen_string_literal: true

# parent model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
