# frozen_string_literal: true

# pokemonDB
class PokemonController < ApplicationController
  def index
    @search = Pokemon.ransack(params[:q])
    @pagy, @pokemon = pagy(@search.result.order("pokedex_id ASC")
                                  .includes(:poke_sprites, :poke_types),
                           size: [1, 2, 2, 1], items: 25)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @sprites = @pokemon.poke_sprites[0]
    @types = @pokemon.poke_types.map(&:p_type)
    @next = Pokemon.find_by(id: @pokemon.id + 1)
    @prev = Pokemon.find_by(id: @pokemon.id - 1)
  end
end
