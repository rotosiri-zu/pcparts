require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET#index" do
    before do
      get posts_path
    end
    it "投稿したPCパーツが一覧で表示される" do
      expect(response).to have_http_status(200)
    end
  end
end