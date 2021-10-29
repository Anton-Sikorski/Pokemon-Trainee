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

  def upcase_first_letter(word)
    word[0] = word[0].upcase
    word
  end

  def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options = {})
    value = value.nil? ? hint : value
    text_field_tag name, value,
                   { onclick: "if($(this).value == '#{hint}'){$(this).value = ''}", onblur: "if($(this).value == ''){$(this).value = '#{hint}'}" }.update(options.stringify_keys)
  end
end
