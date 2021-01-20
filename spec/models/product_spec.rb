require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    it "空欄全てに記述があれば登録できること" do
      expect(@product).to be_valid
    end

    it "商品名が必須であること" do
      @product.product = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product can't be blank")
    end

    it "商品の説明が必須であること" do
      @product.explain = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Explain can't be blank")
    end

    it "商品画像を1枚つけることが必須であること" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end

    it "価格についての情報が必須であること" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "カテゴリーの情報が必須であること(「--」 == 1)" do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
   
    it "商品の状態についての情報が必須であること(「--」 == 1)" do
      @product.state_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("State must be other than 1")
    end
   
    it "配送料の負担についての情報が必須であること(「--」 == 1)" do
      @product.shipping_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping must be other than 1")
    end
   
    it "発送元の地域についての情報が必須であること(「--」 == 1)" do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "発送までの日数についての情報が必須であること(「--」 == 1)" do
      @product.waitday_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Waitday must be other than 1")
    end
   
    it "価格の範囲が、￥9,999,999以下であること" do
      @product.price = 100000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
   
    it "価格の範囲が、¥300以上であること" do
      @product.price = 100
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
   
    it "販売価格は半角数字のみ保存可能であること" do
      @product.price = '１０００'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
    end
   


  end
end
