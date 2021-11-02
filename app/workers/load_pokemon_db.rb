# frozen_string_literal: true

# worker, which populates Pokemon DB
class LoadPokemonDb
  include Sidekiq::Worker
  sidekiq_options lock: :until_executed,
                  on_conflict: :reject
  def perform
    return unless Pokemon.all.empty?

    (1..898).each do |i|
      path = JSON.parse(Net::HTTP.get(URI("https://pokeapi.co/api/v2/pokemon/#{i}")))
      pokemon_data = path
      types_data = path["types"]
      sprite_data = path["sprites"]
      # load pokemon data
      p = Pokemon.new(name: pokemon_data["name"], pokedex_id: pokemon_data["id"].to_i)
      p.save
      Rails.logger.debug { "#{p.name} saved. It's id: #{p.pokedex_id}" }
      # load pokemon types
      types_data.each do |type|
        t = PokeType.new(p_type: type["type"]["name"], pokemon: p)
        t.save
        Rails.logger.debug { "#{t.pokemon.name} type is saved. It's type: #{t.p_type}" }
      end
      # load sprite data
      s = PokeSprite.new(
        back: sprite_data["back_default"],
        pokemon: p,
        artwork: sprite_data["other"]["official-artwork"]["front_default"],
        front: sprite_data["front_default"]
      )
      s.save
      Rails.logger.debug { "It's sprites:\n#{s.front}\n#{s.back}\n#{s.artwork}\n\n" }
    end

    Rails.logger.debug do
      "#{Pokemon.count} pokemon cards with #{PokeType.count}
       types and #{PokeSprite.count} sprites were loaded in DB."
    end
  end
end
