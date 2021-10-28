# frozen_string_literal: true

Fabricator(:article) do
  title { Faker::Lorem.sentence }
  body  { Faker::Lorem.paragraphs }
  user_id { rand(1..10) }
  created_at { Time.zone.now }
end
