class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :edit_limit, only: :edit
    before_action :product_id, except: [:index, :new, :create]

    def index
        @products = Product.all.order(created_at: :desc)
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

    def update
        if @product.update(product_params)
            redirect_to  product_path(@product.id)
        else
            render :edit
        end
    end
    
    def show
    end


    private
    def product_params
        params.require(:product).permit(:product, :explain, :price, :image, :category_id, :prefecture_id, :shipping_id, :state_id, :waitday_id).merge(user_id: current_user.id)
    end

    def edit_limit
        @product = Product.find(params[:id])
        unless current_user == @product.user
            redirect_to root_path
        end
    end

    def product_id
        @product = Product.find(params[:id])
    end
end