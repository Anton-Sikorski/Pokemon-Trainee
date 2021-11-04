# frozen_string_literal: true

require "rails_helper"
require_relative "../support/devise"

RSpec.describe MainController, type: :controller do
  user = Fabricate(:user, created_at: 5.days.ago)
  shared_examples "response test" do
    it "returns successful responce" do
      get url
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "returns successful response" do
      params = { id: user.id }
      get :show, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "GET #index" do
    include_examples "response test" do
      let(:url) { :index }
    end
  end
end
