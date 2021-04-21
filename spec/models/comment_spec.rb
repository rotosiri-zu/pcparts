require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.build(:comment) }

  describe "口コミ投稿が有効な場合" do
    it "口コミ投稿ができること" do
      expect(comment).to be_valid
    end

    describe "口コミタイトルを検証する場合" do
      it "titleがない場合、無効である" do
        comment.title = nil
        comment.valid?
        expect(comment.errors[:title]).to include("を入力してください")
      end
    end

    describe "口コミ評価を検証する場合" do
      it "rateがない場合、無効であること" do
        comment.rate = nil
        comment.valid?
        expect(comment.errors[:rate]).to include("を入力してください")
      end

      it "口コミ評価が1.0だと有効な状態であること" do
        comment.rate = 1.0
        comment.valid?
        expect(comment).to be_valid
      end

      it "口コミ評価が5.0だと有効な状態であること" do
        comment.rate = 5.0
        comment.valid?
        expect(comment).to be_valid
      end
    end

    describe "口コミ内容を検証する場合" do
      it "content内容がないと無効な状態であること" do
        comment.content = nil
        comment.valid?
        expect(comment.errors[:content]).to include("を入力してください")
      end
    end
  end
end
