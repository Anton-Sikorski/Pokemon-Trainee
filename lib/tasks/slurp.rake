# frozen_string_literal: true

require 'json'
require 'net/http'

namespace :slurp do
  desc 'TODO'
  task pokemon_sprites: :environment do
    (1..898).each do |i|
      uri = "https://pokeapi.co/api/v2/pokemon/#{i}"
      pok_source = JSON.parse(Net::HTTP.get(URI(uri)))['sprites']
      p = PokeSprite.new

      p.back = pok_source['back_default']
      p.pokemon = Pokemon.find(i)
      p.artwork = pok_source['other']['official-artwork']['front_default']
      p.front = pok_source['front_default']

      p.save
      print "#{p.id}\n#{p.front}\n#{p.back}\n#{p.artwork}\n\n"
    end

    puts "There are #{PokeSprite.count} in DB."
  end

  desc 'TODO'
  task pokemon: :environment do
    (1..898).each do |i|
      uri = "https://pokeapi.co/api/v2/pokemon/#{i}"
      pok_source = JSON.parse(Net::HTTP.get(URI(uri)))
      p = Pokemon.new
      p.name = pok_source['name']
      p.pokedex_id = pok_source['id'].to_i

      p.save
      puts "#{p.name} saved. It's id: #{p.pokedex_id}"
    end

    puts "There are #{Pokemon.count} in DB."
  end

  desc 'TODO'
  task pokemon_types: :environment do
    (1..898).each do |i|
      uri = "https://pokeapi.co/api/v2/pokemon/#{i}"
      JSON.parse(Net::HTTP.get(URI(uri)))['types'].each do |type|
        t = PokeType.new
        t.p_type = type['type']['name']
        t.pokemon = Pokemon.find(i)

        t.save
        puts "#{t.pokemon.name} types are saved. It's type: #{t.p_type}"
      end
    end

    puts "There are #{PokeType.count} in DB."
  end
end
