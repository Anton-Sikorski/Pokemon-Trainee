# frozen_string_literal: true

# pokemon model
class Pokemon < ApplicationRecord
  has_many :poke_types
  has_many :poke_sprites

  def self.search(search)
    if search != ""
      search.gsub!(/[,.!#&?]/, "")
      if num?(search)
        where(["pokedex_id = ?", search.gsub(/0+/, "")])
      else
        where(["name LIKE ? OR p_type LIKE ?", "%#{search}%", "%#{search}%"]).references(:poke_types)
      end
    else
      all
    end
  end

  def self.num?(str)
    !!Integer(str)
  rescue ArgumentError, TypeError
    false
  end
end
