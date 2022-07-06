# frozen_string_literal: true

# Service object to seed PokemonDB
class PokemonSeeder
  def initialize; end

  def call
    seed_db
  end

  private

    def seed_db
      LoadPokemonDb.perform_async if Pokemon.all.empty?
    end
end
