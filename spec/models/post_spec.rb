require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) {FactoryBot.create(:post)}

  it "画像、タイトル、プライス、テキストがある場合、有効である" do
    expect(post).to be_valid
  end

  it "画像がない場合、無効である" do
    post.image = nil
    post.valid?
    expect(post.errors[:image]).to include('を入力してください')
  end

  it "タイトルがない場合、無効である" do
    post.title = nil
    post.valid?
    expect(post.errors[:title]).to include('を入力してください')
  end
end
