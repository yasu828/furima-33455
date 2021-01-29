class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :porduct_id
  before_action :buy_limit
  before_action :secondbuy


  def index
    @address_buydatum = AddressBuydatum.new 
  end

  def create
    
    @address_buydatum = AddressBuydatum.new(address_params)
    if @address_buydatum.valid?
      pay_item
      @address_buydatum.save

      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address_buydatum).permit(:postalcode, :prefecture_id, :addtwo, :addthree, :building, :tel).merge(user_id: current_user.id, product_id: params[:product_id],token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

def buy_limit
  unless current_user != @product.user
      redirect_to root_path
  end
end

def porduct_id
  @product = Product.find(params[:product_id])
end

def secondbuy
  if @product.buydata.present?
    redirect_to root_path
  end
end