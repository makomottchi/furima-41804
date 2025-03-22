class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new(product_id: @product.id, user_id: current_user.id)
    @prefecture = Prefecture.all
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      @prefecture = Prefecture.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_destination_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(product_id: @product.id, user_id: current_user.id)
  end

end
