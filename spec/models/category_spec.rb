require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  describe "関連づけ" do
    describe "has_many" do
      it "item_category" do
        expect(category).to have_many(:item_category)
      end

      it "items" do
        expect(category).to have_many(:items).through(:item_category)
      end

    end


  end

end
