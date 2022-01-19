# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  name       :string
#  pokedex_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# pokemon model
class Pokemon < ApplicationRecord
  has_many :poke_types, dependent: :destroy
  has_many :poke_sprites, dependent: :destroy

  validates :name, :pokedex_id, presence: true

  ransacker :pokedex_id do
    Arel.sql("to_char(pokedex_id, '99999')")
  end
end
