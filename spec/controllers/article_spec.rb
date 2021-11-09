# frozen_string_literal: true

require "rails_helper"
require_relative "../support/devise"

RSpec.describe ArticlesController, type: :controller do
  user = Fabricate(:user, role: "user")
  article = Fabricate(:article, user_id: user.id, status: "public")
  params = { id: article.id }

  def valid_article_attributes
    { title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs,
      status: "public",
      user_id: Fabricate(:user).id,
      created_at: Time.zone.now }
  end

  shared_examples "response test" do
    it "returns successful responce when user signed in" do
      sign_in user
      get url, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "Authenticated user activities" do
    describe "#index" do
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

  describe "UnAuthenticated user Activities" do
    describe "#index" do
      it "returns true" do
        get :index
        expect(response.status).to eq(200)
      end

      it "renders show" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "#show" do
      it "responce true" do
        get :show, params: params
        expect(response.status).to eq(200)
      end

      it "renders show" do
        get :show, params: params
        expect(response).to render_template(:show)
      end
    end

    describe "#new" do
      it "redirects to root" do
        get :new, params: params
        expect(response).to redirect_to(root_path)
      end
    end
  end

  it "creates article" do
    @article = Article.new(valid_article_attributes).save
    expect(@article).to eq(true)
  end
end
