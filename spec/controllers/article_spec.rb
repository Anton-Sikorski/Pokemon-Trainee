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

  user = Fabricate(:user)
  article = Fabricate(:article, user_id: user.id, status: "public")
  describe "GET index" do
    it "returns a successful response for index" do
      get :index
      expect(response.status).to be(200)
    end
  end

  describe "GET #new" do
    context "from authorized user" do
      login_user
      it "returns a successful response for new" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #show" do
    it "returns a successful response for new" do
      params = { id: article.id }
      get :show, params: params
      expect(response).to have_http_status(:success)
    end
  end
end
