# frozen_string_literal: true

# pokemon model
class Pokemon < ApplicationRecord
  has_many :poke_types
  has_many :poke_sprites

  def self.search(search)
    if search
      search.gsub!(/[,.!#&?]/, "")
      where(["name LIKE ? or p_type LIKE ? or pokedex_id LIKE ?", "%#{search}%", "%#{search}%",
             "%#{search.gsub(/0+/, '')}%"]).references(:poke_types)
    else
      all
    end
  end
end
