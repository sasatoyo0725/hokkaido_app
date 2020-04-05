require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like, user: user, item: item) }
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "バリデーション " do
    context "いいねしていない場合" do
      it "いいねできる" do
        expect(like.valid?).to eq(true)
      end

      context "いいね済みの場合" do
        it "いいねできない" do
          expect(like.invalid?).to eq(false)
        end

      end

    end


  end

  describe "アソシエーション" do
    describe "belongs_to" do
      it "user" do
        expect(like).to belong_to(:user)
      end

      it "item" do
        expect(like).to belong_to(:item)
      end

    end

  end
end
