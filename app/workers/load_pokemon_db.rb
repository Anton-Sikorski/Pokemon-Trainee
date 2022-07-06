# frozen_string_literal: true

# worker, which populates Pokemon DB
class LoadPokemonDb
  API_URL = "https://pokeapi.co/api/v2/pokemon/"
  include Sidekiq::Worker
  sidekiq_options lock: :until_executed,
                  on_conflict: :reject
  def perform
    return unless Pokemon.all.empty?

    (1..898).each do |pokedex_number|
      pokemon_data = load_data(pokedex_number)
      pokemon = new_pokemon(pokemon_data)
      new_types(pokemon_data, pokemon)
      new_sprites(pokemon_data, pokemon)
    end
  end

  def load_data(pokedex_number)
    JSON.parse(Net::HTTP.get(URI(API_URL + pokedex_number.to_s)))
  end

  def new_pokemon(data)
    pokemon = Pokemon.new(
      name: data["name"],
      pokedex_id: data["id"].to_i)
    pokemon.save
  end

  def new_types(data, pokemon)
    data["types"].each do |type|
      PokeType.new(
        p_type: type["type"]["name"],
        pokemon: pokemon
      ).save
    end
  end

  def new_sprites(data,pokemon)
    sprite_data = data["sprites"]

    PokeSprite.new(
      back: sprite_data["back_default"],
      pokemon: pokemon,
      artwork: sprite_data["other"]["official-artwork"]["front_default"],
      front: sprite_data["front_default"]
    ).save
  end
end
