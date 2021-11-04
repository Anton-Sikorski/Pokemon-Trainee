# frozen_string_literal: true

Fabricator(:user) do
  name       { Faker::Name.name }
  email      { Faker::Internet.email }
  password   { Faker::Internet.password(min_length: 6) }
  created_at { 5.days.ago }
end
