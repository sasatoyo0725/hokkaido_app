require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    FactoryBot.create(:item)
  end

  describe "バリデーション " do
    it 'user_idとdescriptionがあればOK' do
      
    end

    it 'user_idが空ならNG' do

    end

    it 'descriptionが空ならNG' do

    end

  end

  describe "関連付け" do
    describe "has_many" do
    it "coments" do

    end

    it "likes" do

    end

    it "like_users" do
    end

    it "images" do

    end
  end

  describe "belongs_to" do
    it "user" do

    end

  end

  end

end
