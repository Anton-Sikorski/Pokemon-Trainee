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

  def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options = {})
    value = hint if value.nil?
    text_field_tag name, value,
                   { onclick: "if($(this).value == '#{hint}'){$(this).value = ''}",
                     onblur: "if($(this).value == ''){$(this).value = '#{hint}'}" }
                     .update(options.stringify_keys)
  end
end
