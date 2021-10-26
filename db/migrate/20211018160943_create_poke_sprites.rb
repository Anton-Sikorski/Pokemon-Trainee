# frozen_string_literal: true

# poke sprites model connected to pokemon model
class CreatePokeSprites < ActiveRecord::Migration[6.1]
  def change
    create_table :poke_sprites do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :front
      t.string :back
      t.string :artwork

      t.timestamps
    end
  end
end
