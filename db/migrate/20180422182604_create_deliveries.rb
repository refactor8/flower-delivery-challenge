class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.string :bouquet, required: true
      t.string :recipient_name, required: true
      t.date :delivery_on, required: true
      t.references :order, foreign_key: true, required: true
      t.string :shipping_method, required: true

      t.timestamps
    end
  end
end
