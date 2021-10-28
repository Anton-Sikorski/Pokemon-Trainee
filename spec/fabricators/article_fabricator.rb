# frozen_string_literal: true

Fabricator(:article) do
  title { Faker::Lorem.sentence }
  body  { Faker::Lorem.paragraphs }
  created_at { Time.zone.now }
end
