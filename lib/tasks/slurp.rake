# frozen_string_literal: true

require "json"
require "net/http"

namespace :pokemon do
  desc "TODO"
  task slurp: :environment do
    unless Pokemon.all.empty?
      Pokemon.delete_all
      PokeType.delete_all
      PokeSprite.delete_all
    end

    API_URL = "https://pokeapi.co/api/v2/pokemon/"

    (1..898).each do |pokedex_number|
      pokemon_data = load_data(pokedex_number)
      pokemon = new_pokemon(pokemon_data)
      new_types(pokemon_data, pokemon)
      new_sprites(pokemon_data, pokemon)
    end

    puts "There are #{Pokemon.count} in DB."
    puts "There are #{PokeType.count} pokemon types in DB."
    puts "There are #{PokeSprite.count} pokemon sprites in DB."
  end

  def load_data(pokedex_number)
    JSON.parse(Net::HTTP.get(URI(API_URL + pokedex_number.to_s)))
  end

  def new_pokemon(data)
    pokemon = Pokemon.new(
      name: data["name"],
      pokedex_id: data["id"].to_i)
    pokemon.save

    puts "#{pokemon.name} saved. It's id: #{pokemon.pokedex_id}"
    pokemon
  end

  def new_types(data, pokemon)
    data["types"].each do |type|
      poke_type = PokeType.new(
        p_type: type["type"]["name"],
        pokemon: pokemon
      )
      poke_type.save

      puts "#{poke_type.pokemon.name} type is saved. It's type: #{poke_type.p_type}"
    end
  end

  def new_sprites(data,pokemon)
    sprite_data = data["sprites"]

    sprite = PokeSprite.new(
      back: sprite_data["back_default"],
      pokemon: pokemon,
      artwork: sprite_data["other"]["official-artwork"]["front_default"],
      front: sprite_data["front_default"]
    )
    sprite.save

    print "It's sprites:\n#{sprite.front}\n#{sprite.back}\n#{sprite.artwork}\n\n"
  end
end

