require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like, user: user, item: item) }
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "アソシエーション" do
    describe "belongs_to" do
      it "user" do
        expect(like).to belong_to(:user)
      end

    end

  end
end
