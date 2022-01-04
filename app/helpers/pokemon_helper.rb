# frozen_string_literal: true

# helper to upgrade pokemon view
module PokemonHelper
  include Pagy::Frontend

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

  def clean_name(name)
    name = name.gsub(/-/," ") if 'Mr' == name.match(/[a-zA-Z]+/).to_s.capitalize
    name.match(/[a-zA-Z\s]+/).to_s.capitalize
  end

  def convert_attr(value)
    "#{value.to_i / 10}." + "#{value % 10}"
  end

  def hinted_text_field_tag(name, value = nil, hint = "Click and enter text", options = {})
    value = hint if value.nil?
    text_field_tag name, value,
                   { onclick: "if($(this).value == '#{hint}'){$(this).value = ''}",
                     onblur: "if($(this).value == ''){$(this).value = '#{hint}'}" }
                     .update(options.stringify_keys)
  end
end
