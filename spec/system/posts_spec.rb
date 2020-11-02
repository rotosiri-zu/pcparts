require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:post) {FactoryBot.create(:post)}
  let(:user) { FactoryBot.create(:user) }
  it '新規投稿したあと、その投稿を編集して最後に削除する' do
    visit root_path
    click_link 'ログイン'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'ログインを記憶する'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    visit root_path
    
  end
end