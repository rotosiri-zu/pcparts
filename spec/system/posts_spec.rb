require "rails_helper"

RSpec.describe "Posts", type: :system do
  let(:post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category) }

  it "新規投稿したあと、その投稿を編集して最後に削除する" do
    visit root_path
    click_link "ログイン"
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content "ログインを記憶する"

    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button "ログイン"
    visit root_path

    # 新規の投稿をする
    click_link "新規投稿"
    expect(current_path).to eq new_post_path

    fill_in "post[image_url]", with: "https://image.sofmap.com/images/product/other/0735858392426_0.jpg?v=20012201"
    fill_in "post[title]", with: "テスト"
    select("カテゴリを選択してください", from: "post[category_id]")
    page.fill_in "post[price]", with: "000"
    fill_in "post[text]", with: "テスト"
    click_button "投稿"
    visit root_path
  end
end