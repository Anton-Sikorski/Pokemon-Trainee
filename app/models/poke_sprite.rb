# frozen_string_literal: true

# == Schema Information
#
# Table name: poke_sprites
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  front      :string
#  back       :string
#  artwork    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# sprites model
class PokeSprite < ApplicationRecord
  belongs_to :pokemon
end
