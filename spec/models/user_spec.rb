require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post) }

  it "有効なファクトリを持つこと" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "ニックネーム、メールアドレス、パスワードがあれば有効な状態であること" do
    user = User.new(
      nickname: "テストユーザー",
      email: "guest@example.com",
      password: "00000000",
    )
    expect(user).to be_valid
  end

  describe "存在性の検証" do
    it "メールアドレスがなければ無効な状態であること" do
      user.email = nil
      user.valid?
      expect(user.errors).to be_added(:email, :blank)
    end

    it "パスワードがなければ無効な状態であること" do
      user.password = user.password_confirmation = " " * 6
      user.valid?
      expect(user.errors).to be_added(:password, :blank)
    end
  end

  describe "一意性の検証" do
    it "重複したメールアドレスなら無効な状態であること" do
      FactoryBot.create(:user, email: "guest@example.com")
      user.email = "guest@example.com"
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it "メールアドレスに@が含まれていないなら無効な状態であること" do
      user.email = "example.com"
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "メールアドレスが保存される前に小文字に変換されること" do
      user.email = "GUEST@example.com"
      user.save!
      expect(user.email).to eq "guest@example.com"
    end
  end
  describe "パスワードを検証する場合" do
    it "パスワードと確認用パスワードが一致していないと無効な状態であること" do
      user.password = "password"
      user.password_confirmation = "invalid_password"
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end
