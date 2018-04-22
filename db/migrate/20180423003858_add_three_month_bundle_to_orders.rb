class AddThreeMonthBundleToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :three_month_bundle, :boolean, default: false
  end
end
