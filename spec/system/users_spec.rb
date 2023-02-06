require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  scenario "新規登録ページに移動できる。" do
    user = FactoryBot.create(:user)
    visit root_path
    click_link "新規登録"
    expect(page).to have_current_path new_user_path
  end

  scenario "新規登録できて、かつユーザー詳細ページに趣味と自己紹介が表示される。" do
    user = FactoryBot.build(:user)
    visit new_user_path

    expect {
      fill_in "名前", with: user.name
      fill_in "メールアドレス", with: user.email
      fill_in "趣味", with: user.hobby
      fill_in "自己紹介", with: user.self_introduction
      click_button "アカウントを作成する"

      expect(page).to have_content user.hobby
      expect(page).to have_content user.self_introduction
    }.to change(User, :count).by(1)
  end

  scenario "ルートページにカードコンポーネントがあり、ユーザー詳細ページに移動できる。" do
    user = FactoryBot.create(:user)
    visit root_path

    expect(page).to have_css ".card"
    click_on user.name
    expect(page).to have_current_path user_path(user)
  end
end
