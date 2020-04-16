require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  before { visit users_path }

  feature "コメント投稿する" do
    scenario "投稿に成功する" do
      click_link "コメントする"
      fill_in "Comment", with: "test"
      click_button "投稿"
      expect(page).to have_content "コメント投稿に成功しました"
    end
    scenario "投稿に失敗する" do

    end
  end
end
