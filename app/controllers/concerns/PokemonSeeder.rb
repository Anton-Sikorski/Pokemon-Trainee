class PokemonSeeder
  def initialize; end

  def call
    seed_db
  end

  private

    def seed_db
      LoadPokemonDb.perform_async if Pokemon.all.empty? # loads pokemon db on first encounter
    end

end
