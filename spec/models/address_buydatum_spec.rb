require 'rails_helper'

RSpec.describe AddressBuydatum, type: :model do
  before do
    @address_buydatum = FactoryBot.build(:address_buydatum)
    @s = @address_buydatum
  end

  it "空欄全てに記述があれば登録できること" do
    expect(@s).to be_valid
  end
  
  
  it "郵便番号が必須であること" do
    @s.postalcode = ''
    @s.valid?
    expect(@s.errors.full_messages).to include("Postalcode can't be blank")
  end

  it "都道府県が必須であること(1 = --)" do
    @s.prefecture_id = '1'
    @s.valid?
    expect(@s.errors.full_messages).to include("Prefecture must be other than 1")
  end
  
  it "市町村が必須であること" do
    @s.addtwo = ''
    @s.valid?
    expect(@s.errors.full_messages).to include("Addtwo can't be blank")
  end

  it "番地が必須であること" do
    @s.addthree = ''
    @s.valid?
    expect(@s.errors.full_messages).to include("Addthree can't be blank")
  end

  it "建物名は任意であること" do
    @s.building = ''
    expect(@s).to be_valid
  end

  it "電話番号が必須であること" do
    @s.tel = ''
    @s.valid?
    expect(@s.errors.full_messages).to include("Tel can't be blank")
  end


  it "郵便番号にハイフンが必須であること" do
    @s.postalcode = '1234567'
    @s.valid?
    expect(@s.errors.full_messages).to include("Postalcode is invalid")
  end

  it "郵便番号がハイフン込みの7文字であること" do
    @s.postalcode = '123-456'
    @s.valid?
    expect(@s.errors.full_messages).to include("Postalcode is invalid")
  end
  
  it "郵便番号が半角数字の7文字であること" do
    @s.postalcode = '１２３-４５６７'
    @s.valid?
    expect(@s.errors.full_messages).to include("Postalcode is invalid")
  end
  
  it "郵便番号が半角数字の7文字であること" do
    @s.postalcode = 'aaa-aaaa'
    @s.valid?
    expect(@s.errors.full_messages).to include("Postalcode is invalid")
  end


  it "電話番号は6〜11文字であること(11文字までしか入力できない)" do
    @s.tel = '12'
    @s.valid?
    expect(@s.errors.full_messages).to include("Tel is invalid")
  end

  it "電話番号は半角数字でなければならないこと" do
    @s.tel = '１２３４５６７８９０１'
    @s.valid?
    expect(@s.errors.full_messages).to include("Tel is invalid")
  end

  it "電話番号は半角数字でなければならないこと" do
    @s.tel = 'aaaaggggfff'
    @s.valid?
    expect(@s.errors.full_messages).to include("Tel is invalid")
  end

end
