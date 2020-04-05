require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  let(:category) { create(:category) }
  let(:item) { create(:item) }

  describe "関連づけ" do
    describe "has_many" do
      it "item" do
        #expect(item_category).to belong_to(:item)

      end

      it "category" do
        #expect(item_category).to belong_to(:category)

      end

    end

  end

end
