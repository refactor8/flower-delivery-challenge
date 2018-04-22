class AddShippingMethodToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :shipping_method, foreign_key: true, required: true
  end
end
