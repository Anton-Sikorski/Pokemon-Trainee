# frozen_string_literal: true

require "rails_helper"

RSpec.describe Article, type: :model do
  user = Fabricate(:user)
  article = Fabricate(:article, user_id: user.id)

  describe "Associations" do
    it { is_expected.to belong_to(:user).without_validating_presence }
  end

  describe "Validations" do
    it "is valid with valid arguments" do
      expect(article).to be_valid
    end
  end
end
