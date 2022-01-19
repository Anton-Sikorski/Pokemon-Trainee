# frozen_string_literal: true

# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  name       :string
#  pokedex_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
Fabricator(:pokemon) do
  name       { Faker::Name.name }
  id         { rand(1..1000) }
  pokedex_id { rand(1..1000) }
  created_at { 5.days.ago }
end
