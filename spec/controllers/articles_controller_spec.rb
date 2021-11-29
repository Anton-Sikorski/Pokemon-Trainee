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

  shared_examples "response test" do |url, user_must_be_signed_in = false|
    if user_must_be_signed_in
      it "forbidden action for ##{url}" do
        get url, params: params
        expect(response.status).to eq(302)
      end

      it "redirects to root" do
        get url, params: params
        expect(response).to redirect_to(root_path)
      end
    else
      it "returns successful responce for ##{url}" do
        sign_in user
        get url, params: params
        expect(response.status).to eq(200)
      end
    end
  end

  describe "#index" do
    include_examples "response test", :index, false
  end

  describe "#show" do
    include_examples "response test", :show, false
  end

  describe "#new" do
    include_examples "response test", :new, true
  end

  describe "#edit" do
    include_examples "response test", :edit, true
  end

  it "creates article" do
    new_article = Article.new(valid_article_attributes).save
    expect(new_article).to eq(true)
  end
end
