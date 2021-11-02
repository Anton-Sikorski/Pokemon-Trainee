# frozen_string_literal: true

# pokemonDB
class PokemonController < ApplicationController
  def index
    @pagy, @pokemon = pagy(Pokemon.includes(:poke_sprites, :poke_types)
                                  .search(params[:search]), size: [1, 2, 2, 1], items: 25)
    LoadPokemonDb.perform_async if Pokemon.all.empty? # loads pokemon db on first encounter
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @sprites = @pokemon.poke_sprites[0]
    @types = @pokemon.poke_types.map(&:p_type)
  end
end
