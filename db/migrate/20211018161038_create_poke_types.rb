# frozen_string_literal: true

# poke types model connected to pokemon model
class CreatePokeTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :poke_types do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.string :p_type

      t.timestamps
    end
  end
end
