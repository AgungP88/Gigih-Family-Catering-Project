require 'rails_helper'

RSpec.describe "Features", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/feature/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/feature/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/feature/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/feature/edit"
      expect(response).to have_http_status(:success)
    end
  end

end