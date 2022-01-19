# frozen_string_literal: true

# == Schema Information
#
# Table name: poke_types
#
#  id         :bigint           not null, primary key
#  pokemon_id :bigint           not null
#  p_type     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# types model
class PokeType < ApplicationRecord
  belongs_to :pokemon
end
