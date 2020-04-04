require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment, user: user, item: item) }
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "バリデーション" do
    context "contentが存在する場合" do
      it "comment登録できる" do
        expect(comment.valid?).to eq(true)
      end
    end

    context "contentが存在しない場合"
    it "commnet登録できない"do
    expect(comment.invalid?).to eq(false)
  end
end

describe "アソシエーション" do
  describe "belongs_to" do
    it "user" do
      expect(comment).to belong_to(:user).optional(:true)
    end

    it "item" do
      expect(comment).to belong_to(:item).optional(:true)
    end

  end

end
end
