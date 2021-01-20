class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        # @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
    end
    
    def show
    end


    private
    def product_params
        params.require(:product).permit(:product, :explain, :price, :image, :category_id, :prefecture_id, :shipping_id, :state_id, :waitday_id).merge(user_id: current_user.id)
    end
end