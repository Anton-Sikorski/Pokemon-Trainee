# frozen_string_literal: true

# pokemon model
class Pokemon < ApplicationRecord
  has_many :poke_types, dependent: :destroy
  has_many :poke_sprites, dependent: :destroy

  validates :name, :pokedex_id, presence: true

  def self.search(search)
    if search != "" && !search.nil?
      search.gsub!(/[,.!#&?]/, "")
      if num?(search)
        where(pokedex_id: search.gsub(/0+/, ""))
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
