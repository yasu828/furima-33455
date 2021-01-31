require 'rails_helper'

RSpec.describe AddressBuydatum, type: :model do
  before do
    @address_buydatum = FactoryBot.build(:address_buydatum)
  end

  it "空欄全てに記述があれば登録できること" do
    expect(@address_buydatum).to be_valid
  end
  
  
  it "郵便番号が必須であること" do
    @address_buydatum.postalcode = ''
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Postalcode can't be blank")
  end

  it "都道府県が必須であること(1 = --)" do
    @address_buydatum.prefecture_id = 1
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Prefecture must be other than 1")
  end
  
  it "市町村が必須であること" do
    @address_buydatum.addtwo = ''
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Addtwo can't be blank")
  end

  it "番地が必須であること" do
    @address_buydatum.addthree = ''
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Addthree can't be blank")
  end

  it "建物名は任意であること" do
    @address_buydatum.building = ''
    expect(@address_buydatum).to be_valid
  end

  it "電話番号が必須であること" do
    @address_buydatum.tel = ''
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Tel can't be blank")
  end


  it "郵便番号にハイフンが必須であること" do
    @address_buydatum.postalcode = '1234567'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Postalcode is invalid")
  end

  it "郵便番号がハイフン込みの7文字であること" do
    @address_buydatum.postalcode = '123-456'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Postalcode is invalid")
  end
  
  it "郵便番号が半角数字の7文字であること" do
    @address_buydatum.postalcode = '１２３-４５６７'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Postalcode is invalid")
  end
  
  it "郵便番号が半角数字の7文字であること" do
    @address_buydatum.postalcode = 'aaa-aaaa'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Postalcode is invalid")
  end


  it "電話番号は6〜11文字であること(11文字までしか入力できない)" do
    @address_buydatum.tel = '12'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Tel is invalid")
  end

  it "電話番号は半角数字でなければならないこと" do
    @address_buydatum.tel = '１２３４５６７８９０１'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Tel is invalid")
  end

  it "電話番号は半角数字でなければならないこと" do
    @address_buydatum.tel = 'aaaaggggfff'
    @address_buydatum.valid?
    expect(@address_buydatum.errors.full_messages).to include("Tel is invalid")
  end

end
