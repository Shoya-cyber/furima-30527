require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do 
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば保存できること' do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          @user.valid?
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では保存できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では保存できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複するemailが存在する場合は保存できないこと' do
          @user.save
          another_user = FactoryBot.build(:user,email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'emailが@を含んでいないと保存できない' do
          @user.email = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが空では保存できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが半角英数字混合でないと保存できないこと' do
          @user.password = "111111"
          @user.password_confirmation = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers")
        end
        it 'passwordが5文字以下であれば保存できないこと' do
          @user.password = "abc12"
          @user.password_confirmation = "abc12"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordが存在してもpassword_confirmationが空では保存できないこと' do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'family_nameが空では保存できないこと' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it 'first_nameが空では保存できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'family_nameが全角日本語でないと保存できないこと' do
          @user.family_name = "suzuki"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
        end
        it 'first_nameが全角日本語でないと保存できないこと' do
          @user.first_name = "taro"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
        end
        it 'family_name_readingが空では保存できないこと' do
          @user.family_name_reading = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name reading can't be blank")
        end
        it 'first_name_readingが空では保存できないこと' do
          @user.first_name_reading = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
        it 'family_name_readingが全角カナでないと保存できないこと' do
          @user.family_name_reading = "ｽｽﾞｷ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.")
        end
        it 'first_name_readingが全角カナでないと保存できないこと' do
          @user.first_name_reading = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
        end
        it 'birth_dateが空では保存できないこと' do
          @user.birth_date = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end
