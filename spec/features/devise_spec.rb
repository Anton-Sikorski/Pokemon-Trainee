# frozen_string_literal: true

require "rails_helper"
require "capybara/rspec"
require_relative "../support/devise"

describe "the registration/authentication process", type: :feature do
  before do
    User.create(name: "username", email: "new_user@example.com", password: "password")
  end

  it "signs me in" do
    visit "/users/sign_up"
    within("#new_user") do
      fill_in "Name", with: "username"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      fill_in "Confirm password", with: "password"
    end
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "signs me up" do
    visit "users/sign_in"
    within("#new_user") do
      fill_in "Email", with: "new_user@example.com"
      fill_in "Password", with: "password"
    end
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
end
