class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    order = Order.new(params[:cart])
    order.save
    redirect_to order_path(order)
  end

  helper_method :order

private

  def order
    @order ||= Order.find(params[:id])
  end
  
end
