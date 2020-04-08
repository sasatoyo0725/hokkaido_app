require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before { visit users_path }

  scenario "コメント投稿する" do
    expect {
      click_link "コメントする"
      fill_in "Comment", with: "test"
      click_button "投稿"
      expect(page).to have_content "コメント投稿に成功しました"
    }
  end
end
