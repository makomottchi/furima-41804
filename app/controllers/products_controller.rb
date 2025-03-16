class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.order(created_at: :desc)
  end

  def new
    @product = Product.new
    set_collections
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      set_collections
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  @product = Product.find(params[:id])
  set_collections
  end

  def show
    @product = Product.find(params[:id])
    set_collections
  end

  def update
    @product = Product.find(params[:id])
    set_collections
    @product.update(product_params)
    if @product.save
      redirect_to @product 

    else
      render :edit, status: :unprocessable_entity
   end
  end

  private

  def set_collections
    @categories = Category.all
    @statuses = Status.all
    @shipping_costs = ShippingCost.all
    @shipping_days = ShippingDay.all
    @prefectures = Prefecture.all
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :category_id, :status_id, :shipping_cost_id, :shipping_day_id,
                                    :prefecture_id).merge(user_id: current_user.id)
  end
end
