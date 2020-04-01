require 'rails_helper'

RSpec.describe Item, type: :model do
 let(:item) { create(:item, user: user) }
 let(:user) { create(:user) }

  describe "バリデーション " do
    it 'user_idとdescriptionがあればOK' do
      expect(item.valid?).to eq(true)
    end

    it 'descriptionが空ならNG' do
      item.description = ''
      expect(item.valid?).to eq(false)
    end

  end

  describe "関連付け" do
    describe "has_many" do
      it "comments" do

      end

      it "likes" do

      end

      it "like_users" do
      end

      it "images" do

      end

      it "categories" do
        
      end
    end

    describe "belongs_to" do
      it "user" do
       expect(item).to belong_to(:user).optional(:true)

      end

    end

  end

end
