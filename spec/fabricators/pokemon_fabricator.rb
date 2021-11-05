# frozen_string_literal: true

Fabricator(:pokemon) do
  name       { Faker::Name.name }
  id         { rand(1..10) }
  pokedex_id { rand(1..10) }
  created_at { 5.days.ago }
end
