require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post_a) { FactoryBot.create(:post) }
  let(:comment_a) {FactoryBot.attributes_for(:comment, user_id: user.id)}
  describe 'POST #create' do
    context 'パラメータが妥当な場合' do
      let(:comment_params) {comment_a}
      it 'リクエストが成功すること' do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect(response.status).to eq 302
      end

      it '口コミの投稿に成功すること' do
        expect do
          sign_in user
          post post_comments_path post_a, params: { comment: comment_params }
        end.to change(Comment, :count).by(1)
      end
      it 'リダイレクトすること' do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect(response).to redirect_to(root_path)
      end
    end
    context 'パラメータが不正な場合' do
      let(:comment_params) {comment_a}
      it 'リクエストが成功すること' do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect(response.status).to eq 302
      end
      it '口コミの投稿に失敗すること' do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect{comment_params}.to_not change(Comment, :count)
      end
      it 'エラーが表示されること' do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        within '#error_explanation' do
          expect(page).to have_content '口コミの投稿に失敗しました。'
        end
      end
    end
  end

  describe 'GET #edit' do
    let(:comment) { FactoryBot.create(:comment, user: user, post_id: post_a.id) }
    it 'リクエストが成功すること' do
      sign_in user
      get edit_post_comment_path(post_id: post_a.id, id: comment.id)
      expect(response.status).to eq 200
    end
  end
end