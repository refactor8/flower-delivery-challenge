class CreateShippingMethods < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_methods do |t|
      t.string :name, required: true
      t.float :price, required: true
      t.timestamps
    end
  end
end
