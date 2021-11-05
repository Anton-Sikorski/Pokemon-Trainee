# frozen_string_literal: true

require "rails_helper"
require_relative "../support/devise"

RSpec.describe ArticlesController, type: :controller do
  def valid_article_attributes
    { title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs,
      status: "public",
      user_id: Fabricate(:user).id,
      created_at: Time.zone.now }
  end

  user = Fabricate(:user, role: "user")
  article = Fabricate(:article, user_id: user.id, status: "public")
  params = { id: article.id }

  shared_examples "response test" do
    it "when user signed in returns successful responce" do
      sign_in user
      get url, params: params
      expect(response.status).to eq(200)
    end
  end

  context "with GET" do
    describe "index" do
      include_examples "response test" do
        let(:url) { :index }
      end
    end

    describe "#new" do
      include_examples "response test" do
        let(:url) { :new }
      end
    end

    describe "#edit" do
      include_examples "response test" do
        let(:url) { :edit }
      end
    end

    describe "#show" do
      include_examples "response test" do
        let(:url) { :show }
      end
    end
  end
end
