# frozen_string_literal: true

require "rails_helper"
require_relative "../support/devise"

RSpec.describe ArticlesController, type: :controller do
  describe "GET index" do
    @article = Article.new(id: 1,
                           title: "Article title",
                           body: "A big amount of useful information",
                           user_id: 1,
                           created_at: Time.zone.now)

    context "from logged in user" do
      login_user
      it "returns a successful response for index" do
        get :index
        expect(response.status).to be(200)
      end

      it "returns a successful response for new" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "returns a successful response for new" do
        get article_url(@article.id)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
