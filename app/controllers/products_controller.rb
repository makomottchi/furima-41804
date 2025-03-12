class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

def index
  @product = Product.all
end

def new
  @product = Product.new
  @categories = Category.all
  @statuses = Status.all
  @shipping_costs = ShippingCost.all
  @shipping_days = ShippingDay.all
  @prefectures = Prefecture.all  
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
  @statuses = Status.all
  @shipping_costs = Shipping_cost.all
  @shipping_days = Shipping_day.all
  @prefectures = Prefecture.all
end

private

def product_params
  params.require(:product).permit(:name, :price, :description,:image,:category_id,:status_id,:shipping_cost_id,:shipping_day_id,:prefecture_id).merge(user_id: current_user.id)
end

end
