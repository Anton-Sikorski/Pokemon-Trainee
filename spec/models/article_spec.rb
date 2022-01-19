# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  status     :string           default("public")
#  views      :integer          default(1)
#
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
