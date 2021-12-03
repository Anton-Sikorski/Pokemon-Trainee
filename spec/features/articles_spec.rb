# frozen_string_literal: true

require "rails_helper"
require "capybara/rspec"
require_relative "../support/devise"

describe "article functional", type: :feature do
  before do
    User.create(name: "username", email: "new_user@example.com", password: "password")
  end

  it "signs in again" do
    visit "users/sign_in"
    within("#new_user") do
      fill_in "Email", with: "new_user@example.com"
      fill_in "Password", with: "password"
    end
  end
end
