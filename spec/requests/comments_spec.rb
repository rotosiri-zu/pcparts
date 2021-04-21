require "rails_helper"

RSpec.describe "Comments", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:post_a) { FactoryBot.create(:post, user: user) }
  let(:comment_a) { FactoryBot.attributes_for(:comment) }
  describe "POST #create" do
    context "パラメータが妥当な場合" do
      let(:comment_params) { comment_a }
      it "リクエストが成功すること" do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect(response.status).to eq 302
      end

      it "口コミの投稿に成功すること" do
        expect do
          sign_in user
          post post_comments_path post_a, params: { comment: comment_params }
        end.to change(Comment, :count).by(1)
      end
      it "リダイレクトすること" do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect(response).to redirect_to(root_path)
      end
    end
    context "パラメータが不正な場合" do
      let(:comment_params) { comment_a }
      it "リクエストが成功すること" do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect(response.status).to eq 302
      end
      it "口コミの投稿に失敗すること" do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        expect { comment_params }.to_not change(Comment, :count)
      end
      it "エラーが表示されること" do
        sign_in user
        post post_comments_path post_a, params: { comment: comment_params }
        within "#error_explanation" do
          expect(page).to have_content "口コミの投稿に失敗しました。"
        end
      end
    end
  end

  describe "GET #edit" do
    let(:comment) { FactoryBot.create(:comment, user: user, post_id: post_a.id) }
    it "リクエストが成功すること" do
      sign_in user
      get edit_post_comment_path(post_id: post_a.id, id: comment.id)
      expect(response.status).to eq 200
    end
    it "口コミのタイトルが表示されていること" do
      sign_in user
      get edit_post_comment_path(post_id: post_a.id, id: comment.id)
      expect(response.body).to include "テスト"
    end
  end

  describe "Pathc #update" do
    let(:comment) { FactoryBot.create(:comment, user: user, post_id: post_a.id) }
    context "パラメータが妥当な場合" do
      it "リクエストが成功すること" do
        sign_in user
        patch post_comment_path(post_id: post_a.id, id: comment.id), params: { comment: comment_a }
        expect(response.status).to eq 302
      end
      it "口コミタイトルが更新されること" do
        sign_in user
        patch post_comment_path(post_id: post_a.id, id: comment.id), params: { comment: comment_a }
        expect(comment.reload.title).to eq "テスト"
      end
    end
    context "パラメータが不正な場合" do
      it "リクエストが成功すること" do
        sign_in user
        patch post_comment_path(post_id: post_a.id, id: comment.id), params: { comment: comment_a }
        expect(response.status).to eq 302
      end

      it "口コミタイトルが更新されないこと" do
        sign_in user
        patch post_comment_path(post_id: post_a.id, id: comment.id), params: { comment: comment_a }
        expect(comment.reload.title).to_not eq "テスト_a"
      end

      it "エラーが表示されること" do
        sign_in user
        patch post_comment_path(post_id: post_a.id, id: comment.id), params: { comment: comment_a }
        within "#error_explanation" do
          expect(page).to have_content "口コミの更新に失敗しました。"
        end
      end
    end
  end

  describe "DELETE #destroy" do
    let(:comment) { FactoryBot.create(:comment, user: user, post_id: post_a.id) }
    it "リクエストが成功すること" do
      sign_in user
      delete post_comment_path(post_id: post_a.id, id: comment.id)
      expect(response.status).to eq 302
    end
    it "口コミが削除されること" do
      expect do
        sign_in user
        delete post_comment_path(post_id: post_a.id, id: comment.id)
      end.to change(Comment, :count).by(0)
    end
    it "トップページにリダイレクトすること" do
      sign_in user
      delete post_comment_path(post_id: post_a.id, id: comment.id)
      expect(response).to redirect_to(root_path)
    end
  end
end