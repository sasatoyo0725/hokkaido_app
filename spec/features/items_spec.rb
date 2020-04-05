require 'rails_helper'

RSpec.feature "Items", type: :feature do

  scenario "ユーザーが新しいitemを作成する" do
    user = create(:user)
    visit root_path

    click_link "ログイン", match: :first

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"

    click_link "新規投稿"

    expect{

      fill_in "description", with: "test"
      check "道央"
      uncheck "道央"
      check "道北"
      uncheck "道北"
      check "道東"
      uncheck "道東"
      check "道南"
      uncheck "道南"
      click_button "新規投稿"

      expect(page).to have_content "投稿に成功しました"

    }.to change(user.items, :count).by(1)


  end

end
