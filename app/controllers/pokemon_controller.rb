# frozen_string_literal: true

# pokemonDB
class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.includes(:poke_sprites, :poke_types).search(params[:search]).page(params[:page])
    # .search(params[:search]).page(params[:page])
    # @pokemon = Pokemon.all.includes(:poke_sprites, :poke_types).page(params[:page])
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @sprites = @pokemon.poke_sprites[0]
  end
end
