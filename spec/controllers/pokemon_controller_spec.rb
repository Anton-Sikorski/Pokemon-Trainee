# frozen_string_literal: true

require "rails_helper"

RSpec.describe PokemonController, type: :controller do
  pokemon = Fabricate(:pokemon)
  params = { id: pokemon.id }

  shared_examples "response test" do
    it "returns successful responce" do
      get url, params: params
      expect(response.status).to eq(200)
    end

    it "redirects to template" do
      get url, params: params
      expect(response).to render_template(url)
    end
  end

  describe "#index" do
    include_examples "response test" do
      let(:url) { :index }
    end
  end

  describe "#show" do
    include_examples "response test" do
      let(:url) { :show }
    end
  end
end
