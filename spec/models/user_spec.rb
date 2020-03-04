require 'rails_helper'

RSpec.describe User, type: :model do
  before do
     @user = build(:user)
   end

   describe 'validations' do
     it 'nameとemailどちらも値が設定されていれば、OK' do
       expect(@user.valid?).to eq(true)
     end

     it 'nameが空だとNG' do
       @user.name = ''
       expect(@user.valid?).to eq(false)
     end

     it 'emailが空だとNG' do
       @user.email = ''
       expect(@user.valid?).to eq(false)
     end

     it 'nameが50文字以上ならNG' do
       @user.name = "a" * 51
       expect(@user.valid?).to eq(false)
     end

     it 'emailが255文字以上ならNG' do
       @user.email = "a" * 244 + "@example.com"
       expect(@user.valid?).to eq(false)
     end

     it 'passwordが8文字以下ならNG' do
       @user.password = @user.password_confirmation = "a" * 7
       expect(@user.valid?).to eq(false)
     end

     it 'passwordが32文字以上ならNG' do
       @user.password = @user.password_confirmation = "a" * 33
       expect(@user.valid?).to eq(false)
     end
   end

    describe 'メールアドレスの有効性' do
      it '重複したメールアドレスは無効にする' do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save
        expect(duplicate_user.valid?).to eq(false)
      end

      it '無効な場合' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
     end

    it '有効な場合' do
      valid_addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
     end

     it '登録したアドレスは小文字に変換される' do
       mixed_case_email = "Foo@ExAMPle.CoM"
       @user.email = mixed_case_email
       @user.save
       expect(@user.reload.email).to eq mixed_case_email.downcase
     end
    end
 end
