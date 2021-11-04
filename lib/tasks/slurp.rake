# frozen_string_literal: true

require "json"
require "net/http"

namespace :slurp do
  desc "TODO"
  task pokemon: :environment do
    (1..898).each do |i|
      uri = "https://pokeapi.co/api/v2/pokemon/#{i}"
      # load pokemon data
      pokemon_data = JSON.parse(Net::HTTP.get(URI(uri)))
      p = Pokemon.new(
        name: pokemon_data["name"],
        pokedex_id: pokemon_data["id"].to_i
      )
      p.save
      puts "#{p.name} saved. It's id: #{p.pokedex_id}"
      # load pokemon types
      JSON.parse(Net::HTTP.get(URI(uri)))["types"].each do |type|
        t = PokeType.new(
          p_type: type["type"]["name"],
          pokemon: p
        )
        t.save
        puts "#{t.pokemon.name} type is saved. It's type: #{t.p_type}"
      end
      # load sprite data
      sprite_data = JSON.parse(Net::HTTP.get(URI(uri)))["sprites"]
      s = PokeSprite.new(
        back: sprite_data["back_default"],
        pokemon: p,
        artwork: sprite_data["other"]["official-artwork"]["front_default"],
        front: sprite_data["front_default"]
      )
      s.save
      print "It's sprites:\n#{s.front}\n#{s.back}\n#{s.artwork}\n\n"
    end

    puts "There are #{Pokemon.count} in DB."
    puts "There are #{PokeType.count} pokemon types in DB."
    puts "There are #{PokeSprite.count} pokemon sprites in DB."
  end
end
