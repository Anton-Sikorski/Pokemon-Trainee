# frozen_string_literal: true

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
