require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = build(:item)
  end
  
  describe "バリデーション " do
    it 'user_idとdescriptionがあればOK' do
      expect(@item.valid?).to eq(true)
    end

    it 'user_idが空ならNG' do

    end

    it 'descriptionが空ならNG' do

    end

  end

end
