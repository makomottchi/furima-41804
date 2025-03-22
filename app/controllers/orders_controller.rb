class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]
  before_action :redirect_if_sold_out, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_destination = OrderDestination.new(product_id: @product.id, user_id: current_user.id)
    @prefecture = Prefecture.all
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?

      pay_item
      @order_destination.save
      redirect_to root_path
    else
      @prefecture = Prefecture.all
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def redirect_if_sold_out
    return unless @product.order.present?

    redirect_to root_path
  end

  def redirect_if_seller
    return unless @product.user_id == current_user.id

    redirect_to root_path
  end

  def order_destination_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(
      token: params[:token], product_id: @product.id, user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_destination_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end
end
