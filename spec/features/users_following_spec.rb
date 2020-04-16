require 'rails_helper'

RSpec.feature "UsersFollowings", type: :feature do
  scenario "フォローする" do
    user = build(:user)
    user.skip_confirmation!
    user.save
    visit root_path
    click_link "ログイン", match: :first

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect {
      click_link "登録者"
      click_link user.name
      click_button "Follow"
      }.to change(user.likes, :count).by(1)

      click_button "Unfollow"

  end
end
