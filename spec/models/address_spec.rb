require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@address).to be_valid
  end

  it "priceが空では登録できないこと" do
    @address.price = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @address.token = nil
    @address.valid?
    expect(@address.errors.full_messages).to include("Token can't be blank")
  end
end