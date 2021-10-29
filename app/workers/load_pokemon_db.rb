# frozen_string_literal: true

# worker, which populates Pokemon DB
class LoadPokemonDb
  include Sidekiq::Worker

  def perform
    return unless Pokemon.all.empty?

    (1..898).each do |i|
      uri = "https://pokeapi.co/api/v2/pokemon/#{i}"
      # load pokemon data
      pokemon_data = JSON.parse(Net::HTTP.get(URI(uri)))
      p = Pokemon.new(
        name: pokemon_data["name"],
        pokedex_id: pokemon_data["id"].to_i
      )
      p.save
      Rails.logger.debug { "#{p.name} saved. It's id: #{p.pokedex_id}" }
      # load pokemon types
      JSON.parse(Net::HTTP.get(URI(uri)))["types"].each do |type|
        t = PokeType.new(
          p_type: type["type"]["name"],
          pokemon: p
        )
        t.save
        Rails.logger.debug { "#{t.pokemon.name} type is saved. It's type: #{t.p_type}" }
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
      Rails.logger.debug { "It's sprites:\n#{s.front}\n#{s.back}\n#{s.artwork}\n\n" }
    end

    Rails.logger.debug { "There are #{Pokemon.count} in DB." }
    Rails.logger.debug { "There are #{PokeType.count} pokemon types in DB." }
    Rails.logger.debug { "There are #{PokeSprite.count} pokemon sprites in DB." }
  end
end
