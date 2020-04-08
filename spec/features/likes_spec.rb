require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  before { visit users_path }


  scenario "いいねする" do
    expect {
      click_on(".topic-index-icon")
      expect(page).to have_content "お気に入りに登録しました"
    }
  end

end
