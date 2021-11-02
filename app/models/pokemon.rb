# frozen_string_literal: true

# pokemon model
class Pokemon < ApplicationRecord
  has_many :poke_types, dependent: :destroy
  has_many :poke_sprites, dependent: :destroy

  validates :name, :pokedex_id, presence: true
end
