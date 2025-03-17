class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

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
    set_collections
  end

  def show
    set_collections
  end

  def update
    set_collections
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def ensure_correct_user
    return unless @product.user_id != current_user.id

    redirect_to root_path
  end

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
