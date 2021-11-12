# frozen_string_literal: true

# worker, which populates Pokemon DB
class LoadPokemonDb
  include Sidekiq::Worker
  sidekiq_options lock: :until_executed,
                  on_conflict: :reject
  def perform
    return unless Pokemon.all.empty?

    (1..898).each do |pokedex_number|
      data = JSON.parse(Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{pokedex_number}")))
      pokemon_data = data
      sprite_data = data["sprites"]
      # load pokemon data
      pokemon = Pokemon.new(name: pokemon_data["name"], pokedex_id: pokemon_data["id"].to_i)
      pokemon.save
      # load pokemon types
      data["types"].each do |type|
        PokeType.new(p_type: type["type"]["name"], pokemon: pokemon).save
      end
      # load sprite data
      PokeSprite.new(
        back: sprite_data["back_default"],
        pokemon: pokemon,
        artwork: sprite_data["other"]["official-artwork"]["front_default"],
        front: sprite_data["front_default"]
      ).save
    end
  end
end
