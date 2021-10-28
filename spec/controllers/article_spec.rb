# frozen_string_literal: true

require "rails_helper"
require_relative "../support/devise"

RSpec.describe ArticlesController, type: :controller do
  article2 = Fabricate(:article)
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
      params = { id: article2.id }
      get :show, params: params
      expect(response).to have_http_status(:success)
    end
  end
end
