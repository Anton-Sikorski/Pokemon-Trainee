# frozen_string_literal: true

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
LoadPokemonDb.perform_async if Pokemon.all.empty? # loads pokemon db on first encounter
