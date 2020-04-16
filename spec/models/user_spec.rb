require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていればOK' do
      expect(user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      user.name = ''
      expect(user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      user.email = ''
      expect(user.valid?).to eq(false)
    end
    it 'nameが50文字以上ならNG' do
      user.name = "a" * 51
      expect(user.valid?).to eq(false)
    end

    it 'nameが49文字以内ならOK' do
      user.name = "a" * 49
      expect(user.valid?).to eq(true)
    end

    it 'emailが255文字以上ならNG' do
      user.email = "a" * 244 + "@example.com"
      expect(user.valid?).to eq(false)
    end

    it 'emailが254文字以内ならOK' do
      user.email = "a" * 242 + "@example.com"
      expect(user.valid?).to eq(true)
    end

    it 'passwordが6文字以下ならNG' do
      user.password = user.password_confirmation = "a" * 5
      expect(user.valid?).to eq(false)
    end

    it 'passwordが6文字以上128文字以内ならOK' do
      user.password = user.password_confirmation = "a" * 6 && "a" * 128
      expect(user.valid?).to eq(true)
    end

    it 'passwordが128文字以上ならNG' do
      user.password = user.password_confirmation = "a" * 129
      expect(user.valid?).to eq(false)
    end

  end

  describe 'メールアドレスの有効性' do
    it '重複したメールアドレスは無効にする' do
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user.valid?).to eq(false)
    end

    it '有効な場合' do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it "メールアドレスの一意性" do
      user = User.create(name: "Test", email: "taro@example.com")
      expect(user).to_not be_valid
    end
  end

  describe "関連づけ" do
    describe "has_many" do
      it "items" do
        expect(user).to have_many(:items).dependent(:destroy)
      end

      it "comments" do
        expect(user).to have_many(:comments).dependent(:destroy)
      end

      it "likes" do
        expect(user).to have_many(:likes).dependent(:destroy)
      end

      it "like_items" do
        expect(user).to have_many(:like_items).through(:likes).source(:item)
      end
    end
  end

  describe "画像投稿" do
    it "画像がアップロードできる" do
      expect(user.image).to be_attached

    end
    
  end
end
