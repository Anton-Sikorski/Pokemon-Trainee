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
require "rails_helper"

RSpec.describe Pokemon, type: :model do
  pokemon = Fabricate(:pokemon)

  it "is valid with valid attributes" do
    expect(pokemon).to be_valid
  end

  it "is not valid without name" do
    pokemon.name = nil
    expect(pokemon).not_to be_valid
  end

  it "is not valid without pokedex id" do
    pokemon.id = nil
    expect(pokemon).not_to be_valid
  end
end
