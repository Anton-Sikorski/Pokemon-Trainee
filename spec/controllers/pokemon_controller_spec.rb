# frozen_string_literal: true

require "rails_helper"

describe PokemonController do
  pokemon = Fabricate(:pokemon)
  describe "#GET index" do
    it "works" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#GET show" do
    it "works" do
      params = { id: pokemon.id }
      get :show, params: params
      expect(response.status).to eq(200)
    end
  end
end
