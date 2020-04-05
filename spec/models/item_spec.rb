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


  describe "関連づけ" do
    describe "has_many" do
      it "comments" do
        expect(item).to have_many(:comments).dependent(:destroy)
      end

      it "likes" do
        expect(item).to have_many(:likes).dependent(:destroy)
      end

      it "like_users"
        #expect(item).to have_many(:like_users).through(:likes).source(:user)
      end

      it "images" do

      end

      it "item_category" do
        expect(item).to have_many(:item_category)
      end

      it "categorires" do
        expect(item).to have_many(:categories).through(:item_category)
      end
    end

    describe "belongs_to" do
      it "user" do
       expect(item).to belong_to(:user).optional(:true)

      end

    end

  end
