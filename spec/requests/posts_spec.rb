require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:post_a) {FactoryBot.attributes_for(:post, user_id: user.id, category_id: category.id)}

  describe "GET#index" do
    let(:post) { FactoryBot.create(:post, user_id: user.id, category_id: category.id) }
    it "リクエストが成功すること" do
      get posts_path post
      expect(response).to have_http_status(200)
    end

    it 'アイテム画像が表示されていること' do
      get posts_path post
      expect(response.body).to include "test.jpg"
    end
  end

  describe "GET#new" do
    it 'リクエストが成功すること' do
      get new_post_path
      expect(response).to have_http_status(302)
    end  
  end

  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      let(:post_params) {post_a}
      it 'リクエストが成功すること' do
        sign_in user
        post posts_path, params: { post: post_params }
        expect(response).to have_http_status 302
      end

      it 'アイテムの登録に成功すること' do
        expect do
          sign_in user
          post posts_path, params: { post: post_params }
        end.to change(Post, :count).by(1)
      end

      it 'リダイレクトすること' do
        sign_in user
        post posts_path, params: { post: post_params }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'パラメータが不正な場合' do
      let(:post_params) {post_a}
      it 'リクエストが成功すること' do
        sign_in user
        post posts_path, params: { post: post_params }
        expect(response).to have_http_status 302
      end

      it 'アイテムの登録に失敗すること' do
        sign_in user
        post posts_path, params: { post: post_params }
        expect{post_params}.to_not change(Post, :count)
      end

      it 'エラーが表示されること' do
        sign_in user
        post posts_path, params: { post: post_params }
        within '#error_explanation' do
          expect(page).to have_content 'アイテムの登録に失敗しました。'
        end
      end
    end
  end
  
  describe 'GET #show' do
    let(:post) { FactoryBot.create(:post, user_id: user.id, category_id: category.id) }
    it 'リクエストが成功すること' do
      sign_in user
      post post_path post
      expect(response).to have_http_status 302
    end
  end

  describe 'GET #edit' do
    let(:post) { FactoryBot.create(:post, user_id: user.id, category_id: category.id) }
    it 'リクエストが成功すること' do
      get edit_post_path post
      expect(response.status).to eq 200
    end

    it 'アイテムのタイトルが表示されていること' do
      get edit_post_path post
      expect(response.body).to include "テスト"
    end
  end
end