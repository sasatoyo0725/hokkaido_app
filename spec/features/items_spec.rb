require 'rails_helper'

RSpec.feature "Items", type: :feature do

  scenario "ユーザーが新しいitemを作成する" do
    user = build(:user)
    user.skip_confirmation!
    user.save
    visit root_path

    click_link "ログイン", match: :first

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    expect{
      click_link "新規投稿"
      fill_in "Description", with: "test"
      click_button "新規投稿"
      expect(page).to have_content "投稿に成功しました"
    }.to change(user.items, :count).by(1)


  end

end
