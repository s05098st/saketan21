require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it 'nickname,email,passwordとpassword_confirmation,frist_name,family_name,first_name_kana,family_name_kana,birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameがないと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailがないと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれない場合は保存できない' do
      @user.email = 'hogehoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid') 
    end

    it 'passwordがないと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが５文字以下は登録できない' do
      @user.password = '1111a'
      @user.password_confirmation = '1111a' 
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが数字だけだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが英語だけだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが異なると登録できない' do
      @user.password = 'sake1'
      @user.password_confirmation = 'sake2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameがないと登録できない' do
      @user.frist_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end

    it 'family_nameがないと登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name can't be blank")
    end

    it 'first_name_kanaがないと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end

    it 'family_name_kanaがないと登録できない' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
    end

    it 'birth_dayがないと登録できない' do
      @user.birth_day = nil
      @user.valid?
      ecpect(@user.errors.full_messages).to include("Birth_day can't be blank")
    end
end
