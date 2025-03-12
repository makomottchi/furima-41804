class ProductsController < ApplicationController

def index
  @product = Product.all
end

def new
  @product = Product.new
  @categories = Category.all  
end

def create
  @product = Product.new(product_params)
  if @product.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
  @product = Product.find(params[:id])
  @categories = Category.all
end

private

def product_params
  params.require(:product).permit(:name, :price, :description,:image).merge(user_id: current_user.id)
end

end
