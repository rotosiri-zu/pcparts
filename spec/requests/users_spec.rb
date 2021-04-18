require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET #show" do
    it "リクエストが成功すること" do
      get user_path user
      expect(response.status).to eq 200
    end
  end
end
