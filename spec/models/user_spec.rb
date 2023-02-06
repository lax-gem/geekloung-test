require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it "名前、メールアドレス、趣味、自己紹介文があれば有効な状態であること" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "趣味がなければ無効な状態であること" do
      user = FactoryBot.build(:user, hobby: nil)
      expect(user).to be_invalid
    end

    it "自己紹介文がなければ無効な状態であること" do
      user = FactoryBot.build(:user, self_introduction: nil)
      expect(user).to be_invalid
    end
  end
end
