require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "新規登録の空欄全てに記述があれば登録できること" do
      expect(@user).to be_valid
    end

    it "emailが空では登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "fnameが空では登録できないこと" do
      @user.fname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname can't be blank")
    end

    it "lnameが空では登録できないこと" do
      @user.lname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname can't be blank")
    end

    it "fkataが空では登録できないこと" do
      @user.fkata = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Fkata can't be blank")
    end
    
    it "lkataが空では登録できないこと" do
      @user.lkata = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lkata can't be blank")
    end

    it "birthが空では登録できないこと" do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが英数字含まないと登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが確認用と両方含まないと登録できないこと" do
      @user.password = "aaa@aaa"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "fkataが全角カタカナでなければ登録できないこと" do
      @user.fkata = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Fkata is invalid")
    end
    
    it "lkataが全角カタカナでなければ登録できないこと" do
      @user.lkata = 'ああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lkata is invalid")
    end

    it "fnameがユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.fname = 'f'
      @user.valid?
      expect(@user.errors.full_messages).to include("Fname is invalid")
    end

    it "lnameがユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.lname = 'f'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lname is invalid")
    end

  end
end