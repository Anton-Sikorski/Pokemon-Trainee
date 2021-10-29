# frozen_string_literal: true

# pokemonDB
class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.includes(:poke_sprites, :poke_types).search(params[:search]).page(params[:page])
    LoadPokemonDb.perform_async
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @sprites = @pokemon.poke_sprites[0]
    @types = @pokemon.poke_types.map {|type| type.p_type}
  end
end
