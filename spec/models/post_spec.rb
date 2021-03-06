require "rails_helper"

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.create(:post) }

  it "image_url、title、price、textがある場合、有効である" do
    expect(post).to be_valid
  end

  it "image_urlがない場合、無効である" do
    post.image_url = nil
    post.valid?
    expect(post.errors[:image_url]).to include("を入力してください")
  end

  it "titleがない場合、無効である" do
    post.title = nil
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "priceがない場合、無効である" do
    post.price = nil
    post.valid?
    expect(post.errors[:price]).to include("を入力してください")
  end

  it "textがない場合、無効である" do
    post.text = nil
    post.valid?
    expect(post.errors[:text]).to include("を入力してください")
  end
end
