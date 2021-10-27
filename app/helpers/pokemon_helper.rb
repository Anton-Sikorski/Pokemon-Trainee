# frozen_string_literal: true

# pokemon
module PokemonHelper
  def format_pokedex_id(id)
    case id.length
    when 1
      "#00#{id}"
    when 2
      "#0#{id}"
    when 3
      "##{id}"
    end
  end
end
