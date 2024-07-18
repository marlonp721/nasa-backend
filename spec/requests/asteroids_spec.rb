require 'rails_helper'

RSpec.describe "Asteroids", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/asteroids/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/asteroids/show"
      expect(response).to have_http_status(:success)
    end
  end

end
