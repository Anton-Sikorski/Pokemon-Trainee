# frozen_string_literal: true

# pokemon model
class Pokemon < ApplicationRecord
  has_many :poke_types, dependent: :destroy
  has_many :poke_sprites, dependent: :destroy

  validates :name, :pokedex_id, presence: true

  ransacker :pokedex_id do
    Arel.sql("to_char(pokedex_id, '99999')")
  end
end
