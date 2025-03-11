class ProductsController < ApplicationController

def index
  @product = Product.all
end

def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  if @product.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

private

def product_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end

end
