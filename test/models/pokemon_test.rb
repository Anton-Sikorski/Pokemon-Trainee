# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  name       :string
#  pokedex_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
