require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、nickname、first_name、last_name、first_kana、last_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "Nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること。" do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
      end
      it "first_kanaが空では登録できない" do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "first_kanaは、カタカナでの入力が必須であること" do
        @user.first_kana = 'たぬき'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid. Input full-width katakana characters")
      end
      it "last_kanaが空では登録できない" do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it "last_kanaは、カタカナでの入力が必須であること" do
        @user.last_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana is invalid. Input full-width katakana characters")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは、6文字以上での入力が必須であること" do
        @user.password = 'abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationは、値の一致が必須であること" do
        @user.password = 'abc123'
        @user.password_confirmation = 'def456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは、半角英数字混合での入力が必須であること" do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
    end
  end
end