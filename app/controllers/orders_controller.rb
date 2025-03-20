class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new(product: @product, user: current_user)
    @prefecture = Prefecture.all
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      @prefectures = Prefecture.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def order_destination_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(product: @product, user: current_user)
  end

end
