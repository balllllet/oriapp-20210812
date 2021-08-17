require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てが入力できていれば登録できること' do
        expect(@user).to be_valid
      end
    end
  
    
    
    context '新規登録がうまくいかないとき' do  
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'introductionが空では登録できない' do
        @user.introduction = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Introductionを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      
      it 'family_name_readingが空では登録できない' do
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
      end

      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してくださ")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end  

      it "メールアドレスは@を含む必要がある" do 
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "family_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do 
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない" do 
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_name_readingは全角（カタカナ）でないと登録できない" do 
        @user.family_name_reading = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid")
      end

      it "first_name_readingは全角（カタカナ）でないと登録できない" do 
        @user.first_name_reading = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end

      it "passwordは英語のみでは登録できない" do 
        @user.password = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordは数字のみでは登録できない" do 
        @user.password = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordは全角では登録できない" do 
        @user.password = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

  
    end
  end
end