# frozen_string_literal: true

# pokemon model creation
class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_id, unique: true

      t.timestamps
    end
  end
end
