# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  article = Article.new(
    title: "Good title",
    body: "High quality text",
    id: 1,
    status: "public"
  )

  describe "Associations" do
    it { should belong_to(:user).without_validating_presence }
  end

  describe "Validations" do
    it "is valid with valid arguments" do
      expect(article).to be_valid
    end
  end
end
