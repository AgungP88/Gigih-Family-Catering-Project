require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/order/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/order/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/order/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/order/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
