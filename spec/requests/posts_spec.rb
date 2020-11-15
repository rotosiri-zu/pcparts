require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe "GET#index" do
    before do
      get posts_path
    end
    it "投稿したPCパーツが一覧で表示される" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET#new" do
    it '投稿ページに移動する' do
      get new_post_path
      expect(response).to have_http_status(302)
    end  
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        sign_in user
        post_params = FactoryBot.attributes_for(:post, user_id: user.id, category_id: category.id)
        post posts_path, params: { post: post_params }
        expect(response).to have_http_status 302
      end
    end
  end
end