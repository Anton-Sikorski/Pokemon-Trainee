# frozen_string_literal: true

# pokemon
module PokemonHelper
  include Pagy::Frontend

  # added temporary until find another solution for page_nav method
  def pagy_nav(pagy, pagy_id: nil, link_extra: "")
    p_id   = %( id="#{pagy_id}") if pagy_id
    link   = pagy_link_proc(pagy, link_extra: link_extra)
    p_prev = pagy.prev
    p_next = pagy.next

    html = +%(<nav#{p_id} class="pagy-nav pagination" aria-label="pager">)
    html << if p_prev
      %(<span class="page prev">#{link.call p_prev, pagy_t('pagy.nav.prev'), 'aria-label="previous"'}</span> )
    else
      %(<span class="page prev disabled">#{pagy_t('pagy.nav.prev')}</span> )
    end
    html << %(<div class="pages">)
    pagy.series.each do |item| # series example: [1, :gap, 7, 8, "9", 10, 11, :gap, 36]
      html << case item
              when Integer then %(<span class="page">#{link.call item}</span> )               # page link
              when String  then %(<span class="page active">#{item}</span> )                  # current page
              when :gap    then %(<span class="page gap">#{pagy_t('pagy.nav.gap')}</span> )   # page gap
              else raise InternalError,
                         "expected item types in series to be Integer, String or :gap; got #{item.inspect}"
      end
    end
    html << %(</div>)
    html << if p_next
      %(<span class="page next">#{link.call p_next, pagy_t('pagy.nav.next'), 'aria-label="next"'}</span>)
    else
      %(<span class="page next disabled">#{pagy_t('pagy.nav.next')}</span>)
    end
    html << %(</nav>)
  end

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
