class OrdersController < ApplicationController
  def index
    @order = Order.new
    @bouquets = Bouquet.all
  end

  def create
    order = Order.new order_params
    if order.save
      redirect_to '/', notice: 'Order saved'
    else
      redirect_to :back, alert: 'There was a problem with your order'
    end
  end

  private

  def order_params
    params.require(:order).permit(:recipient_name, :bouquet_id, :delivery_on)
  end
end