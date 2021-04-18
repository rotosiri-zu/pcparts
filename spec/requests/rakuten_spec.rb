require "rails_helper"

RSpec.describe "Rakutens", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/rakuten/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/rakuten/show"
      expect(response).to have_http_status(:success)
    end
  end
end
