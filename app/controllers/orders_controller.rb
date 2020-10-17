class OrdersController < ApplicationController

  def index
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    Address.create(address_params(order))
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end

  end

  private

  def order_params
    params.require(:order).merge(token: params[:token], user_id: user.id, item_id: item.id)
  end

  def address_params(order)
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: order.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @order.item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end

