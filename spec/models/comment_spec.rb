require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment, user: user, item: item) }
  let(:user) { create(:user) }
  let(:item) { create(:item) }
  
  describe "アソシエーション" do
    describe "belongs_to" do
      it "user" do
        expect(comment).to belong_to(:user).optional(:true)
      end

    end

  end
end
