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
        expect(response).to have_http_status 302
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
    
  end
end