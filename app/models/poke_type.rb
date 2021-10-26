# frozen_string_literal: true

# types model
class PokeType < ApplicationRecord
  belongs_to :pokemon
end
